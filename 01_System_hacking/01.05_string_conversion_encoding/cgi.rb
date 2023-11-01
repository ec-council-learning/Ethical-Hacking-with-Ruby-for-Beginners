require 'ctf_party'

puts 'http://vulnerable.site/search.aspx?txt="><script>alert(/Rubyfu/.source)</script>'.urlencode
puts "'Stop!' said Fred".urlencode_component
puts

puts 'http://vulnerable.site/search.aspx?txt=%22%3E%3Cscript%3Ealert(/Rubyfu/.source)%3C/script%3E'.urldecode
puts '%27Stop%21%27+said+Fred'.urldecode_component
puts

puts 'Usage: foo "bar" <baz>'.htmlescape
puts "Usage: foo &quot;bar&quot; &lt;baz&gt;".htmlunescape
