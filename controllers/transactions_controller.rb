require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/transactions' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:"transaction/show")
end

post '/new' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to (:"transactions/new")
end
