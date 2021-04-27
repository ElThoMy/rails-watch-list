# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
require 'json'
require 'open-uri'

puts "Cleaning database"
Movie.destroy_all
puts "Done"

puts "Pulling API data"
url = 'http://tmdb.lewagon.com/movie/top_rated'
top_rated_serialized = URI.open(url).read
top_rated = JSON.parse(top_rated_serialized)

top_rated['results'].each do |movie|
  puts Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}")
end

puts "Done"
