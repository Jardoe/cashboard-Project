require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

# get '/transactions' do
#   @transaction = Transaction.find(params['id'].to_i)
#   erb(:"transaction/show")
# end

get '/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
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
  @tags = Tag.all()
  @transaction = Transaction.find(params[:id])
  erb( :"transactions/edit" )
end

get '/transactions/:id/view' do
  erb(:"transactions/show")
end

post '/tranasctions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to (:"transactions/delete")
end
