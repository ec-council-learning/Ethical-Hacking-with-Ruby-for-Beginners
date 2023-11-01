require 'open3'

Open3.popen3('dc') do |inp, out, err, thr|
  inp.puts(6)
  inp.puts(7)
  inp.puts('*')
  inp.puts('p')
  puts out.gets
end
