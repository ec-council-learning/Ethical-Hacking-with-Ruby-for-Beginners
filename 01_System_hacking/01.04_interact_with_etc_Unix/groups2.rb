require 'etc'

group = Etc.getgrgid(992)
puts "group: #{group.name} (#{group.gid})"

group2 = Etc.getgrnam('wheel')
puts "group: #{group2.name} (#{group2.gid})"
