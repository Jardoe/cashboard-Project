require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')

# get '/transactions' do
#   @transaction = Transaction.find(params['id'].to_i)
#   erb(:"transaction/show")
# end

get '/new' do
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:"transactions/new")
end

post '/transactions/added' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to (:"transactions/added")
end

get '/transactions/added' do
  erb(:"transactions/added")
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all()
  @categories = Category.all()
  @transaction = Transaction.find(params[:id])
  erb( :"transactions/edit" )
end

post '/transactions/:id' do
  binding.pry
  transaction = Transaction.new(params)
  transaction.update()
  redirect to (:'transactions/edited')
end

get '/transactions/edited' do
  erb(:"transactions/edited")
end

get '/transactions/:id/view' do
  erb(:"transactions/show")
end

get '/transactions/:id/delete?' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/delete?")
end

post '/transactions/:id/delete?' do
  Transaction.delete(params[:id])
  redirect to (:"transactions/deleted")
end

get '/transactions/deleted' do
  erb(:"transactions/deleted")
end

get '/hyperspace' do
  erb(:'hyperspace')
end
