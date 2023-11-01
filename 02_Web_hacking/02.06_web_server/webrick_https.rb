# frozen_string_literal: true

# CLI one liner:
#
# `ruby -run -e httpd /srv/http -p 4343 --ssl-certificate=CERT --ssl-private-key=KEY`

require 'webrick'
require 'webrick/https'

cert = [
  %w[CN example.org]
]

server = WEBrick::HTTPServer.new(Port: 4343, DocumentRoot: '/srv/http',
                                 SSLEnable: true, SSLCertName: cert)
# Starting the server blocks the current thread
trap('INT') { server.shutdown }
server.start
