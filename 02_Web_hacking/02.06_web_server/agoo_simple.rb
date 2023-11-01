# frozen_string_literal: true

# CLI one liner:
#
# `agoo -d /srv/http -p 4242 -t 2 -w 1 -v`

require 'agoo'

# https://rubydoc.info/gems/agoo/Agoo/Server#init-class_method
Agoo::Server.init(4242, '/srv/http', thread_count: 2, worker_count: 1)

class DataLogger
  def call(_req)
    [200, {}, ['codered']]
  end
end

handler = DataLogger.new
Agoo::Server.handle(:GET, '/**/*', handler)
Agoo::Server.handle(:POST, '/data', handler)
Agoo::Server.start
