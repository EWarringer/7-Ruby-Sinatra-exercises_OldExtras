# Made by Erik Warringer, Leise St. Clair

require "sinatra"
require 'json'

# Read the contents of the tomatoes.json file into a string
json_string = IO.read('roster.json')
# Convert the JSON string into Ruby data structures
teams = JSON.parse(json_string)


get "/kickball_teams/names" do
  erb :index, locals: { team_names: teams.keys }
end

get "/kickball_teams/:team" do
  erb :show, locals: { team: params[:team], team_roster: teams[params[:team]]}
end


get "/kickball_teams/positions" do
  erb :index_position, locals: { team_positions: teams["Simpson Slammers"].keys}
end
