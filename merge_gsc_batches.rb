#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'date'

puts "\n🔄 GSC Batch Merger - Combine Multiple CSV Exports"
puts "=" * 80

# Configuration
OUTPUT_FILE = 'gsc_all_urls_complete_merged.csv'

def find_csv_files
  # Look for CSV files that look like GSC exports
  Dir.glob('*.csv').select do |file|
    file != OUTPUT_FILE && 
    file != 'gsc_all_urls.csv' && 
    file != 'gsc_all_urls_complete.csv'
  end
end

def merge_csv_files(files)
  puts "\n📋 Files to merge:"
  files.each_with_index do |file, i|
    size = File.size(file) / 1024.0
    puts "   #{i + 1}. #{file} (#{size.round(1)} KB)"
  end
  
  all_urls = {}
  
  files.each do |file|
    puts "\n📥 Processing: #{file}"
    
    begin
      CSV.foreach(file, headers: true) do |row|
        url = row['URL'] || row['url']
        last_crawled = row['Last crawled'] || row['Last Crawled'] || row['last_crawled']
        
        next unless url
        
        # Use most recent crawl date if duplicate
        if all_urls[url]
          existing_date = Date.parse(all_urls[url][:last_crawled]) rescue Date.new(2000, 1, 1)
          new_date = Date.parse(last_crawled) rescue Date.new(2000, 1, 1)
          
          if new_date > existing_date
            all_urls[url] = { url: url, last_crawled: last_crawled }
          end
        else
          all_urls[url] = { url: url, last_crawled: last_crawled }
        end
      end
      
      puts "   ✓ Loaded #{all_urls.length} unique URLs so far"
    rescue => e
      puts "   ⚠️  Warning: Could not process #{file}: #{e.message}"
    end
  end
  
  all_urls.values
end

def categorize_url(url)
  case url
  when %r{/t/[^/]+/\d+}
    'topic'
  when %r{/tag/}
    'tag'
  when %r{/c/}
    'category'
  when %r{/u/}
    'user'
  when %r{/g/}
    'group'
  else
    'other'
  end
end

def export_merged(urls, filename)
  puts "\n📝 Exporting merged data to: #{filename}"
  
  CSV.open(filename, 'w') do |csv|
    csv << ['URL', 'Type', 'Last Crawled', 'Status']
    
    urls.each do |url_data|
      csv << [
        url_data[:url],
        categorize_url(url_data[:url]),
        url_data[:last_crawled],
        'Crawled - not indexed'
      ]
    end
  end
  
  puts "   ✓ Export complete!"
end

def generate_statistics(urls)
  puts "\n📊 Merged URL Statistics:"
  puts "-" * 80
  
  types = urls.group_by { |u| categorize_url(u[:url]) }
  types.sort_by { |type, _| type }.each do |type, urls_list|
    puts "   #{type.capitalize.ljust(15)}: #{urls_list.length.to_s.rjust(6)} URLs"
  end
  
  puts "   #{'TOTAL'.ljust(15)}: #{urls.length.to_s.rjust(6)} URLs"
  puts "-" * 80
end

# Main execution
begin
  csv_files = find_csv_files
  
  if csv_files.empty?
    puts "\n⚠️  No CSV files found to merge!"
    puts "\n📖 INSTRUCTIONS TO GET ALL 4,839 URLs:"
    puts "=" * 80
    puts "\n1. Go to Google Search Console:"
    puts "   https://search.google.com/search-console/index/validation"
    puts "\n2. Click on 'Crawled - currently not indexed' (4,839 pages)"
    puts "\n3. Export in batches using date filters:"
    puts "   - Filter: 'Last crawl date'"
    puts "   - Set date range to get <1000 results per export"
    puts "   - Example batches:"
    puts "     • 2026-01-08 to 2026-01-15 → Export as 'batch1.csv'"
    puts "     • 2026-01-01 to 2026-01-07 → Export as 'batch2.csv'"
    puts "     • 2025-12-15 to 2025-12-31 → Export as 'batch3.csv'"
    puts "     • 2025-12-01 to 2025-12-14 → Export as 'batch4.csv'"
    puts "     • Earlier dates → Export as 'batch5.csv'"
    puts "\n4. Save all batch*.csv files in this directory"
    puts "\n5. Run this script again: ruby merge_gsc_batches.rb"
    puts "\n💡 TIP: Adjust date ranges so each export has <1000 URLs"
    puts "=" * 80
    puts "\nAlternatively, you can use the 4,373 URLs from sitemap for now.\n"
    exit 0
  end
  
  puts "\n✅ Found #{csv_files.length} CSV file(s) to merge"
  
  merged_urls = merge_csv_files(csv_files)
  
  puts "\n✅ Merge complete!"
  puts "   Total unique URLs: #{merged_urls.length}"
  
  generate_statistics(merged_urls)
  export_merged(merged_urls, OUTPUT_FILE)
  
  puts "\n" + "="*80
  puts "✅ SUCCESS!"
  puts "="*80
  puts "\nOutput file: #{OUTPUT_FILE}"
  puts "Total URLs: #{merged_urls.length}"
  
  if merged_urls.length < 4800
    puts "\n⚠️  NOTE: Expected ~4,839 URLs from GSC"
    puts "   Current count: #{merged_urls.length}"
    puts "   Missing: ~#{4839 - merged_urls.length} URLs"
    puts "\n   Export more batches from GSC to get complete data."
  end
  
  puts "\n💡 Next step: Run prioritization analysis"
  puts "   ruby analyze_and_prioritize.rb\n\n"
  
rescue StandardError => e
  puts "\n❌ ERROR: #{e.message}"
  puts e.backtrace.join("\n")
  exit 1
end
