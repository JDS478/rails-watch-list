# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'faker'

# require "json"
# require 'open-uri'

# url = "https://tmdb.lewagon.com/movie/top_rated"
# response = URI.open(url).read
# response = File.read(url)
# films = JSON.parse(response)
# image = films.results[]


#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Deleting Current Entries...."
Movie.destroy_all
puts "Generating new Movies..."

10.times do
  movie = Movie.create(title: Faker::Movie.title, rating: Faker::Number.within(range: 1..5), overview: Faker::Movie.quote)
  movie.save
end
