require 'json'
require 'open-uri'

API_URL = 'https://gitlab.com/api/v4/'

# Recently created public projects
#=begin
projects = JSON.parse(URI.open(API_URL + 'projects').read)
projects.each do |proj|
  puts "#{proj['path_with_namespace']} - #{proj['description']}"
end
#=end

# List user projects
#=begin
projects = JSON.parse(URI.open(API_URL + 'users/noraj/projects').read)
projects.each do |proj|
  puts "#{proj['name']} (#{proj['star_count']})"
  puts proj['last_activity_at']
  puts proj['topics']
  puts
end
#=end