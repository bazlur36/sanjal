#!/usr/bin/env ruby
# frozen_string_literal: true

require 'google/apis/searchconsole_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'csv'
require 'date'

# Configuration
CREDENTIALS_PATH = 'client_secret_848370050353-sf41r1gc9u1mdf8kmc0rknpfjjjvjr22.apps.googleusercontent.com.json'
TOKEN_PATH = 'token.yaml'
SCOPE = Google::Apis::SearchconsoleV1::AUTH_WEBMASTERS_READONLY
SITE_URL = 'sc-domain:sanjal.com'
OUTPUT_FILE = 'gsc_all_urls.csv'

class GSCFetcher
  def initialize
    @service = Google::Apis::SearchconsoleV1::SearchConsoleService.new
    @service.client_options.application_name = 'Sanjal SEO Tool'
    @service.authorization = authorize
  end

  def authorize
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: 'urn:ietf:wg:oauth:2.0:oob')
      puts "\n" + "="*80
      puts "🔐 AUTHORIZATION REQUIRED"
      puts "="*80
      puts "\nOpen this URL in your browser and authorize the application:"
      puts "\n#{url}\n"
      puts "\nAfter authorization, you'll get a code."
      puts "Copy and paste it here:"
      print "> "
      code = gets.chomp
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: 'urn:ietf:wg:oauth:2.0:oob'
      )
    end
    
    credentials
  end

  def fetch_all_crawled_not_indexed_urls
    puts "\n" + "="*80
    puts "📥 FETCHING URLS FROM GOOGLE SEARCH CONSOLE"
    puts "="*80
    puts "\nSite: #{SITE_URL}"
    puts "Fetching: Crawled - currently not indexed pages"
    puts "\nThis may take a few minutes...\n\n"

    all_urls = []
    start_row = 0
    row_limit = 25000 # API maximum per request
    batch_count = 1

    begin
      loop do
        puts "📦 Fetching batch ##{batch_count} (starting from row #{start_row})..."
        
        # Create request for URL inspection data
        request = Google::Apis::SearchconsoleV1::InspectUrlIndexRequest.new(
          inspect_url_index_request: {
            site_url: SITE_URL
          }
        )

        # For getting crawled but not indexed URLs, we need to use the URL Testing Tools API
        # However, this requires individual URL checks. Instead, we'll use a different approach.
        
        # Let's get all URLs from the site and their index status
        response = fetch_batch(start_row, row_limit)
        
        break if response.nil? || response.empty?
        
        all_urls.concat(response)
        puts "   ✓ Retrieved #{response.length} URLs (Total so far: #{all_urls.length})"
        
        break if response.length < row_limit
        
        start_row += row_limit
        batch_count += 1
        
        # Rate limiting - be nice to the API
        sleep(1)
      end

      puts "\n" + "-"*80
      puts "✅ FETCH COMPLETE!"
      puts "   Total URLs retrieved: #{all_urls.length}"
      puts "-"*80
      
      all_urls
    rescue Google::Apis::Error => e
      puts "\n❌ ERROR: #{e.message}"
      puts "\nIf you see 'invalid_grant', delete token.yaml and run again."
      []
    end
  end

  def fetch_batch(start_row, row_limit)
    # Note: The Search Console API doesn't directly expose "crawled but not indexed" pages
    # We'll need to get this data differently. Let's use the URL inspection approach
    # For now, we'll parse from the Coverage report via the Search Console URL
    
    # Alternative: Read from existing CSV and validate
    puts "\n⚠️  NOTE: The GSC API doesn't directly expose 'Crawled - not indexed' status."
    puts "         We need to use a different approach.\n"
    
    # Let's use the sitemap approach instead
    []
  end

  def export_to_csv(urls, filename)
    return if urls.empty?
    
    puts "\n📝 Exporting to CSV: #{filename}"
    
    CSV.open(filename, 'w') do |csv|
      csv << ['URL', 'Last Crawled', 'Status']
      urls.each do |url_data|
        csv << [
          url_data[:url],
          url_data[:last_crawled],
          'Crawled - not indexed'
        ]
      end
    end
    
    puts "   ✓ Export complete: #{urls.length} URLs saved"
  end
end

# Alternative approach: Use the existing Table.csv data
def use_existing_csv_data
  puts "\n" + "="*80
  puts "📊 ALTERNATIVE APPROACH: Using Existing GSC Export"
  puts "="*80
  
  table_csv = 'gsc-analysis-and-action-plan/sanjal.com-Coverage-Drilldown-2026-01-15/Table.csv'
  
  unless File.exist?(table_csv)
    puts "\n❌ ERROR: Table.csv not found at: #{table_csv}"
    puts "\nPlease ensure the file exists or export all URLs from GSC manually."
    return
  end
  
  puts "\n📥 Reading existing CSV: #{table_csv}"
  
  urls = []
  CSV.foreach(table_csv, headers: true) do |row|
    urls << {
      url: row['URL'],
      last_crawled: row['Last crawled']
    }
  end
  
  puts "   ✓ Loaded #{urls.length} URLs from existing export"
  
  # Export to our standardized format
  CSV.open(OUTPUT_FILE, 'w') do |csv|
    csv << ['URL', 'Last Crawled', 'Status']
    urls.each do |url_data|
      csv << [
        url_data[:url],
        url_data[:last_crawled],
        'Crawled - not indexed'
      ]
    end
  end
  
  puts "\n✅ Data exported to: #{OUTPUT_FILE}"
  puts "   Total URLs: #{urls.length}"
  puts "\n💡 TIP: To get all 4,840 URLs, you'll need to:"
  puts "   1. Export from GSC in batches using date filters"
  puts "   2. Or use the sitemap + API validation approach"
  puts "   3. For now, we'll work with the #{urls.length} URLs available\n"
end

# Main execution
if __FILE__ == $0
  puts "\n🚀 Sanjal.com - GSC URL Fetcher"
  puts "=" * 80
  
  # Check if credentials file exists
  unless File.exist?(CREDENTIALS_PATH)
    puts "\n❌ ERROR: Credentials file not found!"
    puts "   Expected: #{CREDENTIALS_PATH}"
    puts "\n   Please ensure the OAuth credentials JSON file is in the current directory."
    exit 1
  end
  
  # For now, use the existing CSV approach since GSC API has limitations
  # for accessing "crawled but not indexed" data directly
  puts "\n⚠️  NOTE: The GSC API has limitations for batch fetching 'crawled but not indexed' URLs."
  puts "         We'll use the existing CSV data and provide instructions for getting all URLs.\n"
  
  use_existing_csv_data
  
  puts "\n" + "="*80
  puts "✅ PROCESS COMPLETE"
  puts "="*80
  puts "\nNext step: Run the analysis script:"
  puts "   ruby analyze_and_prioritize.rb\n\n"
end
