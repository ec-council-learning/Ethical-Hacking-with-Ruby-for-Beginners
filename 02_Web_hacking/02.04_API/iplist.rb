require 'json'
require 'open-uri'

API_URL = 'https://iplist.cc/api/'

# IPv6
ip = JSON.parse(URI.open(API_URL + '2a00:d880:5:509::face').read)
puts ip

# IPv4
ip = JSON.parse(URI.open(API_URL + '54.39.46.56').read)
puts ip

# Hostname
host = JSON.parse(URI.open(API_URL + 'pwn.by').read)
puts host

# Your IP
ip = JSON.parse(URI.open(API_URL).read)
puts ip