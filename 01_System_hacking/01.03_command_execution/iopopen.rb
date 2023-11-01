out = IO.popen('python', 'r+') do |pipe|
  pipe.puts('import sys')
  pipe.puts('print(sys.version)')
  pipe.puts('ver_short = (sys.version_info.major,sys.version_info.minor,sys.version_info.micro)')
  pipe.puts('print(".".join(map(str, ver_short)))')
  pipe.close_write
  pipe.read
end

puts out
