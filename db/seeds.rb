require "open-uri"
require "json"

puts "Creating 10 movies..."

url = "https://tmdb.lewagon.com/movie/top_rated?&page=1"
response = URI.open(url).read
movies = JSON.parse(response)["results"].first(10)

movies.each do |movie|
  record = Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  )
  puts "Created #{record.title}!"
end

puts "Created all 10 movies!"
