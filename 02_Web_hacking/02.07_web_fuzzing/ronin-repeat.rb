# frozen_string_literal: true

require 'ronin/fuzzing'

puts "# Repeat 'A' 50 times"
puts '## Without Ronin'
puts 'A' * 50
puts '## With Ronin'
puts 'A'.repeating(50)

puts "\n# Repeat 'A' 10, 20, …, 100 times"
'A'.repeating((10..100).step(10)) do |str|
  puts "#{str.size}: #{str}"
end

puts "\n# Repeat 'A' 256, 4096, 65536 times"
'A'.repeating([2**8, 2**12, 2**16]) do |str|
  puts "#{str[0..str.size / 100]}[…]#{str[-2..]} (#{str.size})"
end
