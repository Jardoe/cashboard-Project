require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')

get '/categories' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get "/categories/new" do
  erb(:"tags/new")
end

post "/categories/new" do
  tag = Tag.new(params)
  tag.save()
  redirect to (:'categories/added')
end

get '/categories/added' do
  erb(:'tags/added')
end


get '/categories/:id' do
  @tag = Tag.find(params['id'].to_i)
  @transactions = @tag.transactions
  erb(:"tags/show")
end
