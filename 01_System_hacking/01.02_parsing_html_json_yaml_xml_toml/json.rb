require 'json'
require 'net/http'

data = JSON.parse(Net::HTTP.get(URI('https://inventory.raw.pm/api/api.json')))
cracking_tools = data['tools']['cracking']['tools']
cracking_tools.each do |tool|
    puts "#{tool['name']} is written in #{tool['language']}"
end