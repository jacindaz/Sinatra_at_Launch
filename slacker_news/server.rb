require 'sinatra'
require 'rubygems'
require 'csv'
require 'pry'


#METHODS--------------------------------------------------------------


#ROUTES AND VIEWS------------------------------------------------------
get '/' do
  @title = "Slacker News"

  erb :index
end
