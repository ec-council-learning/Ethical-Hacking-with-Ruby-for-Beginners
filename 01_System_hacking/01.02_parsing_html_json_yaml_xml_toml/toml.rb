require 'toml-rb'
require 'net/http'

toml = Net::HTTP.get(URI('https://raw.githubusercontent.com/ffuf/ffuf/master/ffufrc.example'))
ffufrc = TomlRB.parse(toml, symbolize_keys: true)
status = ffufrc[:matcher][:status]
status.split(',').each do |s|
    puts s.to_i
end