require 'etc'
require 'pp'

current_username = Etc.getlogin
current_user = Etc.getpwnam(current_username)
pp current_user

puts Etc.getpwuid(0).name
