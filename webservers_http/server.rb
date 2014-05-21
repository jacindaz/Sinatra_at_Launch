require 'sinatra'
require 'rubygems'

puts "Got here"

#ROUTES AND VIEWS-----------------------------------------

get '/tasks/:task_name' do
  @task = params[:task_name]
  # The :task_name is available in our params hash
  erb :show
end

get '/' do
  @title = "Home Page"
  "You've reached the home page!"
end



# #IF GET A 404 NOT FOUND ERROR--------------------------------------------
# not_found do
#   @title = "Oops! Jacinda created a bug."
#   erb :index
# end
