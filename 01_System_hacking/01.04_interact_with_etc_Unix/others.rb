require 'etc'
require 'pp'

puts "Temporary directory: #{Etc.systmpdir}"
puts "System configuration directory: #{Etc.sysconfdir}"
pp Etc.uname
