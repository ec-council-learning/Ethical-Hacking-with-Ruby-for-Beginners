# frozen_string_literal: true

# CLI one liner:
#
# `iodine -www /srv/http -p 4242 -t 1 -w 1 -v`

require 'iodine'

Iodine.listen(service: :http, public: '/srv/http', port: 4242, log: 1) {}
Iodine.threads = 1
Iodine.workers = 1
Iodine.start
