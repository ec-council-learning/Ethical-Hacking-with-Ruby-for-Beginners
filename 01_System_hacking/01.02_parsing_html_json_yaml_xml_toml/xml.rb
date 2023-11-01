require 'rexml/document'
require 'net/http'

xml = Net::HTTP.get(URI('https://blog.raw.pm/rss.xml'))
rss = REXML::Document.new(xml)

rss.root.elements.each('channel/item/title') { |x| puts x.text }

require 'nokogiri'

rss2 = Nokogiri::Slop(xml)

rss2.search('item/category').uniq { |x| x.text }.sort { |a, b| a.text <=> b.text }.map { |c| puts "#{c.text}: #{c.attributes['domain']}" }