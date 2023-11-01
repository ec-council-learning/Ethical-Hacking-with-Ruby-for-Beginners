require 'sqlite3'

# Open an existing database or create a new one
db = SQLite3::Database.new 'people.db'

# Create a table
db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
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
  db.execute('INSERT OR IGNORE INTO users (email, first_name, last_name, password, username)
              VALUES (?, ?, ?, ?, ?)',
            [u[:email], u[:first_name], u[:last_name], u[:password], u[:username]])
end

# Find entries
puts 'Users:'
db.execute('SELECT username, email FROM users WHERE first_name LIKE \'A%\'' ) do |row|
  p row
end
puts

# List all tables
puts 'Tables:'
db.execute('SELECT * FROM sqlite_master WHERE type=\'table\'') do |row|
  p row
end