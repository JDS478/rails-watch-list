# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'

require 'json'
require 'open-uri'

url = "https://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
parsed_file = JSON.parse(response)
# films = JSON.parse(response)
puts "Deleting Current Entries...."
Movie.destroy_all
puts "Generating new Movies..."
# puts parsed_file["results"]

parsed_file["results"].first(10).each do |film|
  # puts film
  # puts "film"
  Movie.create!(title: film["original_title"], rating: Faker::Number.within(range: 1..5), overview: film["overview"], poster_url: film["poster_path"])
  # puts film["original_title"]
end

puts "Success created #{Movie.all.length}!"

# 'http://tmdb.lewagon.com/movie/top_rated?'
