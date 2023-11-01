# docker run -d --name mariadb-ruby-course --env MARIADB_USER=ruby --env MARIADB_PASSWORD=oSAy49NiooLUhke9 --env MARIADB_ROOT_PASSWORD=gPYYPxRtg4XXRNK9Ng5J -p 192.168.0.62:3306:3306 mariadb:latest

require 'mysql2'

# Connect to the database
db_root = Mysql2::Client.new(host: '192.168.0.62',
                             port: 3306,
                             username: 'root',
                             password: 'gPYYPxRtg4XXRNK9Ng5J')

# Create database
db_root.query <<-SQL
  CREATE DATABASE IF NOT EXISTS ruby CHARACTER SET 'utf8';
SQL

# Grant permissions to user
db_root.query <<-SQL
  GRANT ALL PRIVILEGES ON ruby.* TO ruby@'%';
SQL

db_user = Mysql2::Client.new(host: '192.168.0.62',
                             port: 3306,
                             username: 'ruby',
                             password: 'oSAy49NiooLUhke9',
                             database: 'ruby')

# Create a table
db_user.query <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(64) NULL,
    first_name VARCHAR(32) NULL,
    last_name VARCHAR(32) NULL,
    password VARCHAR(64) NULL,
    username VARCHAR(32) NULL,
    UNIQUE(username, email)
  );
SQL

[
  {
    email: 'noraj@pwn.by',
    first_name: 'Alexandre',
    last_name: 'IMTIM',
    password: '2$UEq@$uLWj%$jdu',
    username: 'noraj'
  },
  {
    email: 'dridri@pwn.by',
    first_name: 'Adrien',
    last_name: 'DEUTROA',
    password: 'YH5MvE^j3e3o`cbc',
    username: 'adri'
  },
  {
    email: 'clecle@pwn.by',
    first_name: 'Clément',
    last_name: 'TINE',
    password: 'khKfxz9XWStMQ~u4',
    username: 'cle42'
  }
].each do |u|
  # Insert entries
  statement = db_user.prepare('INSERT IGNORE INTO users (email, first_name, last_name, password, username)
              VALUES (?, ?, ?, ?, ?)')
  statement.execute(u[:email], u[:first_name], u[:last_name], u[:password], u[:username])
end

# Find entries
puts 'Users:'
db_user.query('SELECT username, email FROM users WHERE first_name LIKE \'A%\'' ).each do |row|
  p row
end
puts

# List all tables
puts 'Tables:'
db_user.query('SELECT table_schema,table_name FROM information_schema.tables WHERE table_schema != \'mysql\' AND table_schema != \'information_schema\'').each do |row|
  p row
end