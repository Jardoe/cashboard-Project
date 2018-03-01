require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category.rb')

get '/categories' do
  @categories = Category.all()
  erb(:"categories/index")
end

get "/categories/new" do
  erb(:"categories/new")
end

post "/categories/new" do
  category = Category.new(params)
  category.save()
  redirect to (:'categories/added')
end

get '/categories/added' do
  erb(:'categories/added')
end


get '/categories/:id' do
  @category = Category.find(params['id'].to_i)
  @transactions = @category.transactions
  erb(:"categories/show")
end
