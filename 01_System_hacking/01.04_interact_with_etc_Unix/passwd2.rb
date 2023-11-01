require 'etc'

Etc.passwd do |u|
  puts "#{u.name}: #{u.gecos}"
end
