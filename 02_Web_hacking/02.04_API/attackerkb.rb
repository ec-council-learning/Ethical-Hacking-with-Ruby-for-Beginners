require 'json'
require 'net/http'

API_URL = 'https://api.attackerkb.com/v1/'

headers = {
  Accept: 'application/json',
  Authorization: 'basic ' + File.read('.attackerkb.secret')
}

# Vulnerability information
uri = URI("#{API_URL}topics/cve-2023-38490")
data = JSON.parse(Net::HTTP.get(uri, headers))['data']
puts data['name']
puts
puts 'Vendor: ' + data['metadata']['vendor']['vendorNames'].first
puts 'Product: ' + data['metadata']['vendor']['productNames'].first
puts 'Vulnerable versions:'
data['metadata']['vulnerable-versions'].each do |ver|
  puts ver
end
puts
puts data['document']
