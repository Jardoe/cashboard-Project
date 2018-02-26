require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')

get '/categories' do
  @tags = Tag.all()
  erb(:"tags/index")
end


get '/categories/:id' do
  @tag = Tag.find(params['id'].to_i)
  @transactions = @tag.transactions
  erb(:"tags/show")
end

post 'categories/:id/delete' do
  
end
