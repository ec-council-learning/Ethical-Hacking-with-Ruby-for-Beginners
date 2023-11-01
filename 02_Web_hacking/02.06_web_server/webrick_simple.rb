# frozen_string_literal: true

# CLI one liner:
#
# `ruby -run -e httpd /srv/http -p 4242`

require 'webrick'

server = WEBrick::HTTPServer.new(Port: 4242, DocumentRoot: '/srv/http')
# Starting the server blocks the current thread
trap('INT') { server.shutdown }
server.start
