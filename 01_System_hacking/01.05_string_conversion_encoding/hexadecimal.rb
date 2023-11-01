require 'ctf_party'

puts 'ff'.hex2dec
puts '\xf3'.hex2dec(prefix: '\x')
puts '6e6f72616a'.hex2dec
puts '\\x6e\\x6f\\x72\\x61\\x6a'.hex2dec(prefix: '\\x')
puts

puts '255'.dec2hex
puts '255'.dec2hex({prefix: '0x', case: :upper})
puts '10'.dec2hex(padding: 2)
puts '10'.dec2hex(padding: 8)
puts '474316169578'.dec2hex(prefixall: '\\x')
puts

puts 'noraj'.to_hex
puts '6e6f72616a'.from_hex
puts 'ab'.hex2bin
puts '11110011'.bin2hex

