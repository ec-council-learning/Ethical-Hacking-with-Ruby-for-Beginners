require 'ctf_party'

puts '1.1.1.1'.defang_ip
puts '2606:4700:4700::1111'.defang_ip
puts

puts '1[.]1[.]1[.]1'.refang_ip
puts '2606[:]4700[:]4700[:][:]1111'.refang_ip
puts

puts 'ftp://ftp.ruby-lang.org/pub/ruby/3.2/ruby-3.2.0.tar.xz'.defang_uri
puts 'hxxp://noraj[.]neverssl[.]com/online/'.refang_uri
puts

puts 'pwn.by'.defang_domain
puts 'pwn[.]by'.refang_domain
puts

puts 'noraj.rawsec@pwn.by'.defang_email
puts 'noraj+alias[@]pwn[.]by'.refang_email
