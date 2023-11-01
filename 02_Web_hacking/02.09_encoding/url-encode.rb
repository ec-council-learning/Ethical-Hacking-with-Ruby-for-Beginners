require 'ctf_party'

my_url = 'http://vulnerable.site/search?txt="><script>alert(/noraj/.source)</script>'
my_url_component = "'Wait!' said François"

puts 'URL encode'
puts my_url.urlencode
puts my_url_component.urlencode

puts "\nURL encode component, POST data"
puts my_url.urlencode_component
puts my_url_component.urlencode_component

my_url2 = 'http://vulnerable.site/search?txt=%22%3E%3Cscript%3Ealert(/noraj/.source)%3C/script%3E'
my_url_component2 = "'Wait!'%20said%20Fran%C3%A7ois"

puts "\nURL decode"
puts my_url2.urldecode
puts my_url_component2.urldecode

my_url3 = 'http%3A%2F%2Fvulnerable.site%2Fsearch%3Ftxt%3D%22%3E%3Cscript%3Ealert%28%2Fnoraj%2F.source%29%3C%2Fscript%3E'
my_url_component3 = "%27Wait%21%27+said+Fran%C3%A7ois"

puts "\nURL decode component, POST data"
puts my_url3.urldecode_component
puts my_url_component3.urldecode_component