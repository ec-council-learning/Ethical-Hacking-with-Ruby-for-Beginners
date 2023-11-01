require 'ctf_party'

puts 'Super lib!'.to_b64
puts 'UnVieQ=='.from_b64
puts

puts 'SGVsbG8gd29ybGQh'.b64?
puts 'SGVsbG8g@@d29ybGQh'.b64?
