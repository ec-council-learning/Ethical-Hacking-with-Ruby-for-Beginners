require 'ctf_party'

my_css = '<link rel="stylesheet" href="css/vendor/bulma/bulma.css" type="text/css">'

puts 'HTML escape'
puts my_css.htmlescape

my_css2 = '&lt;link rel=&quot;stylesheet&quot; href=&quot;css/vendor/bulma/bulma.css&quot; type=&quot;text/css&quot;&gt;'

puts "\nHTML unescape"
puts my_css2.htmlunescape
