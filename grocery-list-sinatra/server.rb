require "pry"
require "sinatra"
require "csv"

def groceries
  groceries = []
  CSV.foreach("grocery_list.csv") do |row|
    groceries << row
  end
  groceries
end

get "/groceries" do
  erb :index, locals: { groceries: groceries }
end

get "/groceries/:grocery_name" do
  binding.pry
  erb :show, locals: { grocery_name: groceries}
end

post "/groceries" do
  CSV.open("grocery_list.csv", 'a') do |csv|
    csv << [params["item"], params["quantity"]]
  end
  redirect "/groceries"
end
