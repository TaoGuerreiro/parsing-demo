require "json"
require "open-uri"

user = gets.chomp

url = "https://api.github.com/users/#{user}"

user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
# p user
puts "#{user["name"]} - #{user["bio"]} - #{user["location"]}"
