require "sinatra"
require 'pry'

get '/places' do
  places_two = File.readlines("places.txt")
  erb :index, locals: { places_three: places_two }
end

post "/places_five" do
  # Read the input from the form the user filled out
  item = params["places_six"]
# binding.pry
  #Open the "tasks.txt" file and append the task
  File.open("places.txt", "a") do |file|
    file.puts(item)
  end

  # Send the user back to the home page which shows
  # the list of tasks
  redirect "/places"
end
