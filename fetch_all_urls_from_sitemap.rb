#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'nokogiri'
require 'csv'
require 'zlib'
require 'stringio'

puts "\n🚀 Sanjal.com - Complete URL Fetcher (via Sitemap)"
puts "=" * 80

SITEMAP_URL = 'https://sanjal.com/sitemap.xml'
OUTPUT_FILE = 'gsc_all_urls_complete.csv'

def fetch_sitemap(url)
  puts "\n📥 Fetching sitemap: #{url}"
  
  uri = URI(url)
  response = Net::HTTP.get_response(uri)
  
  unless response.is_a?(Net::HTTPSuccess)
    puts "❌ Error fetching sitemap: #{response.code} #{response.message}"
    return nil
  end
  
  # Check if response is gzipped
  body = if response['content-encoding'] == 'gzip'
    Zlib::GzipReader.new(StringIO.new(response.body)).read
  else
    response.body
  end
  
  puts "   ✓ Sitemap fetched successfully"
  body
end

def parse_sitemap(xml_content)
  puts "\n🔍 Parsing sitemap XML..."
  
  doc = Nokogiri::XML(xml_content)
  
  # Handle sitemap index (if it contains links to other sitemaps)
  sitemap_urls = doc.xpath('//xmlns:sitemap/xmlns:loc').map(&:text)
  
  if sitemap_urls.any?
    puts "   ℹ️  Found sitemap index with #{sitemap_urls.length} sub-sitemaps"
    all_urls = []
    
    sitemap_urls.each_with_index do |sitemap_url, index|
      puts "   📦 Fetching sub-sitemap #{index + 1}/#{sitemap_urls.length}: #{sitemap_url}"
      sub_sitemap = fetch_sitemap(sitemap_url)
      next unless sub_sitemap
      
      sub_urls = parse_urlset(sub_sitemap)
      all_urls.concat(sub_urls)
      puts "      ✓ Found #{sub_urls.length} URLs (Total: #{all_urls.length})"
      
      sleep(0.5) # Be nice to the server
    end
    
    all_urls
  else
    # Direct URL set
    parse_urlset(xml_content)
  end
end

def parse_urlset(xml_content)
  doc = Nokogiri::XML(xml_content)
  urls = doc.xpath('//xmlns:url')
  
  urls.map do |url_node|
    {
      url: url_node.at_xpath('xmlns:loc')&.text,
      lastmod: url_node.at_xpath('xmlns:lastmod')&.text,
      changefreq: url_node.at_xpath('xmlns:changefreq')&.text,
      priority: url_node.at_xpath('xmlns:priority')&.text
    }
  end.compact
end

def categorize_url(url)
  case url
  when %r{/t/[^/]+/\d+$}
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

def export_to_csv(urls, filename)
  puts "\n📝 Exporting to CSV: #{filename}"
  
  CSV.open(filename, 'w') do |csv|
    csv << ['URL', 'Type', 'Last Modified', 'Status', 'Priority', 'Change Frequency']
    
    urls.each do |url_data|
      csv << [
        url_data[:url],
        categorize_url(url_data[:url]),
        url_data[:lastmod] || 'Unknown',
        'Crawled - not indexed',
        url_data[:priority] || '',
        url_data[:changefreq] || ''
      ]
    end
  end
  
  puts "   ✓ Export complete: #{urls.length} URLs saved"
end

def generate_statistics(urls)
  puts "\n📊 URL Statistics:"
  puts "-" * 80
  
  # By type
  types = urls.group_by { |u| categorize_url(u[:url]) }
  types.each do |type, urls_list|
    puts "   #{type.capitalize.ljust(15)}: #{urls_list.length.to_s.rjust(6)} URLs"
  end
  
  puts "   #{'Total'.ljust(15)}: #{urls.length.to_s.rjust(6)} URLs"
  puts "-" * 80
end

# Main execution
begin
  sitemap_content = fetch_sitemap(SITEMAP_URL)
  
  unless sitemap_content
    puts "\n❌ Failed to fetch sitemap. Please check the URL and try again."
    exit 1
  end
  
  all_urls = parse_sitemap(sitemap_content)
  
  puts "\n✅ Parsing complete!"
  puts "   Total URLs found: #{all_urls.length}"
  
  generate_statistics(all_urls)
  export_to_csv(all_urls, OUTPUT_FILE)
  
  puts "\n" + "="*80
  puts "✅ COMPLETE!"
  puts "="*80
  puts "\nOutput file: #{OUTPUT_FILE}"
  puts "Total URLs: #{all_urls.length}"
  puts "\n💡 Next steps:"
  puts "   1. Review the complete URL list"
  puts "   2. Run prioritization script: ruby analyze_and_prioritize.rb"
  puts "   3. Focus on top 800-1,000 URLs for optimization\n\n"
  
rescue StandardError => e
  puts "\n❌ ERROR: #{e.message}"
  puts e.backtrace.join("\n")
  exit 1
end
