require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML5(URI.open("https://inventory.raw.pm/tools.html"))
tools = page.css('#tools-cracking td.has-text-weight-bold > a')
tools.each do |tool|
    puts tool.children.text
end