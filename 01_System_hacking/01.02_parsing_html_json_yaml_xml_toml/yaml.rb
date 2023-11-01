require 'yaml'
require 'net/http'

template = YAML.load(Net::HTTP.get(URI('https://raw.githubusercontent.com/projectdiscovery/nuclei-templates/main/http/cves/2021/CVE-2021-39211.yaml')))
references = template['info']['reference']
references.each do |reference|
    puts reference
end

puts template.dig('info', 'classification', 'cwe-id').split(',')