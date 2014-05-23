require 'sinatra'
require 'rubygems'
require 'pry'
require 'csv'


#METHODS--------------------------------------------------------------
def load_csv(file_name)
  articles = []
  CSV.foreach(file_name, headers: true, header_converters: :symbol) do |article_hash|
    articles << article_hash.to_hash
  end
  articles
end


#ROUTES AND VIEWS------------------------------------------------------
get '/' do
  @title = "Slacker News"
  @articles = load_csv('articles.csv')

  #binding.pry

  erb :index
end

get '/new_article' do
  @title = "Submit a new article"

  erb :new_article
end

post '/article' do
  @article_title = params[:title]
  @url = params[:url]
  @description = params[:description]

  #binding.pry

  File.open('articles.csv', 'a') do |file|
    file.puts("#{@article_title}, #{@url}, #{@description}")
  end

  redirect '/'
end
