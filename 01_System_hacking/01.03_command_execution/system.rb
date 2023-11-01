system('date') # displays directly to STDOUT
puts

ret = system('ls')
puts ret
puts

ret = system('ls -z')
puts ret
