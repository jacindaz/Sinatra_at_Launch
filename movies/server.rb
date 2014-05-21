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


#ROUTES AND VIEWS------------------------------------------------------
get '/' do
  @title = "All Movies Page"
  @all_movies = load_movies("movies.csv")
  @titles_array = title_array(@all_movies, :title)

  erb :index
end


get '/team/:team_name' do
  @title = "Team Homepage"
  @team = params[:team_name]
  @team_contacts = load_contacts('lackp_starting_rosters.csv')

  @teamhash = filter_by(@team_contacts, @team, :team)
  #@teamhash = team_array(@team_contacts, @team)

  erb :team
end
