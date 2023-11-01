# docker run -d --name redis-ruby-course -e REDIS_PASSWORD=guuCVk3CDp2ZwwheSSKW -p 192.168.0.62:6379:6379 bitnami/redis:latest

require 'redis'

# Connect to the database
redis = Redis.new(host: '192.168.0.62', port: 6379, db: 1, password: 'guuCVk3CDp2ZwwheSSKW')

config = {
  color_accent: '#ff5050',
  color_background: '##33363b',
  name: 'Rawsec Cybersecurity Inventory',
  website: 'https://inventory.raw.pm/',
  source: 'https://gitlab.com/rawsec/rawsec-cybersecurity-list'
}.each do |k, v|
  # Insert if does not exists
  redis.setnx(k.to_s, v)
end

# Get a key value
puts 'Name:'
puts redis.get('name')
puts

# Get several keys
puts 'URLs:'
redis.mget('website', 'source').map { |x| puts x }
puts

# Get several keys in a hash
puts 'URLs:'
p redis.mapped_mget('website', 'source')
puts

# Get all keys
puts 'Keys:'
p redis.keys
puts

# Get all keys matching a pattern
puts 'Colors:'
p redis.mapped_mget(*redis.keys('color_*'))
puts

# Set the time to live (TTL) in seconds of a key
redis.setex('noraj', '3600', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Im5vcmFqIiwiaWF0IjoxNTE2MjM5MDIyfQ.BwdZeBBepT9pAj16G2IEGL0TmDI510fwVY8NIYilNs0')

# Get the TTL in seconds of a key
puts 'noraj JWT TTL:'
puts redis.ttl('noraj')
