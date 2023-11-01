require 'find'

path = ARGV[0]

search = Find.find(path)

def potential_eop_files(search)
    search.select do |file|
        File.file?(file) && File.executable?(file) && File.writable?(file)
    end
end

puts potential_eop_files(search)