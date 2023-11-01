File.readlines('create.txt').each_with_index do |line, i|
    puts "(#{i + 1})> #{line.chomp}"
end