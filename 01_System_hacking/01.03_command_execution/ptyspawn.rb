require 'pty'
PTY.spawn('printenv', '_') do |r, w, pid|
  puts r.gets
end
