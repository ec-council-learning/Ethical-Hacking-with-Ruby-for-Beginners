puts 'Kernel#`'
puts `date`
puts

puts '%x{}' # we can use nearly any delimiter
puts %x{echo 'curly braces'}
puts %x[echo 'square brackets']
puts %x"echo 'double quotes'"
puts %x$echo 'dollar sign'$
puts %x|echo 'pipe'|
puts %x/echo 'slash'/
puts

puts 'get pid and exit status code'
output = `date` # we can retrieve stdout as a string
puts $?
puts $?.success?
`date -z` # stderr is displayed even if not printed
puts $?
puts $?.success?
