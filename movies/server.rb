require 'sinatra'
require 'rubygems'
require 'csv'

#METHODS--------------------------------------------------------------
def load_movies(file_name)
  movies = []
  CSV.foreach(file_name, headers: true, header_converters: :symbol) do |movie|
    movies << movie.to_hash
  end
  movies
end

def title_array(movies_hashes, attribute)
  movie_attribute = []
  attribute_str = attribute.to_s
  movies_hashes.each do |movie_hash|
    title = movie_hash[attribute]
    if !movie_attribute.include?(attribute_str)
      movie_attribute << movie_hash[attribute]
    end
  end
  movie_attribute.sort_by {|title| title.downcase}
end


#input any key/attribute and return the hash that matches the target
#for ex: if this hash has a key :title that matches the target, return that entire hash
def get_movie_hash(movies_hashes, attribute, target)
  movies_hashes.each do |movie_hash|
    if movie_hash[attribute] == target
      return movie_hash
    else
      puts "Error! Reached else statement in get_movie_hash"
    end
  end
end


#ROUTES AND VIEWS------------------------------------------------------
get '/' do
  @title = "All Movies Page"
  @all_movies = load_movies("movies.csv")
  @titles_array = title_array(@all_movies, :title)

  erb :index
end


get '/movies/:movie_id' do
  @title = "Individual Movie"
  @movie_id = params[:movie_id]
  @all_movies = load_movies("movies.csv")

  @movie_info = get_movie_hash(@all_movies, :id, @movie_id)

  erb :show
end
