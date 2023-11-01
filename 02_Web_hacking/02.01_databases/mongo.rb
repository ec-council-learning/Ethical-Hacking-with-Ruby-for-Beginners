# docker run -d --name mongodb-ruby-course -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=c7dNC2phtmkZDc7cow45 -p 192.168.0.62:27017:27017 mongo:latest

require 'mongo'

# Connect to the database
client = Mongo::Client.new([ '192.168.0.62:27017' ],
                           database: 'admin',
                           user: 'root',
                           password: 'c7dNC2phtmkZDc7cow45')

# Create database
Mongo::Database.new(client, :ruby)

client = client.with( database: 'ruby',
                      user: 'root',
                      password: 'c7dNC2phtmkZDc7cow45' )

# Create a collection (created on usage)
collection = client[:users]
# Alternative method
#db = client.database
#Mongo::Collection.new(db, 'user')

docs = [
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
]
# Insert a document
#collection.insert_many(docs)
# Insert a document or update
docs.each do |doc|
  collection.replace_one(
    { username: doc[:username] },
    doc,
    { upsert: true }
  )
end

# Find documents
puts 'Users:'
collection.find({ "first_name": { "$regex": /^A/ } }, projection: { _id: 0, username: 1, email: 1 }).each do |document|
  puts document
end
puts

# List all collections
puts 'Collections:'
db = client.database
p db.collection_names
