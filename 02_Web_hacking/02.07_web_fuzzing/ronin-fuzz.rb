# frozen_string_literal: true

require 'ronin/fuzzing'

def fuzz_url
  '/page/?user=noraj&pass=azerty'.fuzz(/noraj|azerty/ => ["'", "')", "'))", '"', '")', '"))']) do |str|
    p str
  end
  # Could replace payload with https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/SQLi/quick-SQLi.txt
end

FILES = [
  'index.html',
  'UPGRADE.txt',
  'INSTALL.md',
  'admin.php'
].freeze
# Could replace files with https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-small-files.txt

def fuzz_ext
  FILES.each do |file|
    file.fuzz(file_ext: ['.aspx', '.jsp', '.rb', '.cr']) do |f|
      puts f
    end
  end
end

def path_truncation(max = 2048)
  '/reader?page=FUZZ'.fuzz('FUZZ' => String.generate(['./', 1..max])) do |tr|
    puts tr
  end
end

# fuzz_url
# fuzz_ext
path_truncation(100)
