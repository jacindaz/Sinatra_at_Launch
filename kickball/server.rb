require 'sinatra'
require 'rubygems'
require 'csv'

#METHODS--------------------------------------------------------------
def load_contacts(file_name)
  contacts = []
  CSV.foreach(file_name, headers: true, header_converters: :symbol) do |contact|
    contacts << contact.to_hash
  end

  contacts
end

def team_array(array_of_hashes, team_name)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == team_name
      final_array << nested_hash
    end
  end
  final_array
end

def position_array(array_of_hashes, position_name)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:position] == position_name
      final_array << nested_hash
    end
  end
  final_array
end



#ROUTES AND VIEWS------------------------------------------------------
#need to figure out why this syntax doesn't work
#get('/styles.css'){ css :styles }


get '/' do
  @title = "Home Page"
  @contacts = load_contacts('lackp_starting_rosters.csv')

  @team_names = []
  @contacts.each do |team_member_hash|
    if !@team_names.include?(team_member_hash[:team])
      @team_names << team_member_hash[:team]
    end
  end

  @positions = []
  @contacts.each do |team_member_hash|
    if !@positions.include?(team_member_hash[:position])
      @positions << team_member_hash[:position]
    end
  end

  erb :home
end


get '/team/:team_name' do
  @title = "Team Homepage"
  @team = params[:team_name]
  @team_contacts = load_contacts('lackp_starting_rosters.csv')

  @teamhash = team_array(@team_contacts, @team)

  erb :team
end


get '/position/:position_name' do
  @title = "Team Members by Position"
  @position = params[:position_name]
  @team_contacts_pos = load_contacts('lackp_starting_rosters.csv')

  @positionhash = position_array(@team_contacts_pos, @position)

  erb :position
end


get '/allteams' do
  @title = "All Team Info"
  @all_teams = load_contacts('lackp_starting_rosters.csv')
  erb :allteams
end



#IF GET A 404 NOT FOUND ERROR--------------------------------------------
not_found do
  @title = "Oops! "
  puts "Oops! Jacinda created a bug."
  erb :home
end



