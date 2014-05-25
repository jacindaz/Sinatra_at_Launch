require 'sinatra'
require 'rubygems'
require 'pry'

puts "Got here"

#ROUTES AND VIEWS-----------------------------------------

get '/tasks/:task_name' do
  @tasks = params[:task_name]
  # The :task_name is available in our params hash
  erb :show
end

get '/' do
  @tasks = File.readlines('tasks')
  erb :index
end



post '/tasks' do
  #binding.pry

  # Read the input from the form the user filled out
  task = params['task_name']

  # Open the "tasks" file and append the task
  File.open('tasks', 'a') do |file|
    file.puts(task)
  end

  # Send the user back to the home page which shows
  # the list of tasks
  redirect '/'

  erb :show
end



# #IF GET A 404 NOT FOUND ERROR--------------------------------------------
# not_found do
#   @title = "Oops! Jacinda created a bug."
#   erb :index
# end
