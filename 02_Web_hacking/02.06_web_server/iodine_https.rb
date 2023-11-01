# frozen_string_literal: true

# CLI one liner: (automatic self-signed certificate)
#
# `iodine -www /srv/http -p 4242 -t 1 -w 1 -v -b 127.0.0.2 -tls`

require 'iodine'

host = '127.0.0.2'
Iodine.listen(service: :http, public: '/srv/http', port: 4242, log: 1, bind: host, tls: Iodine::TLS.new(host)) {}
Iodine.threads = 1
Iodine.workers = 1
Iodine.start
