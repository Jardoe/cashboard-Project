require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')

get '/' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  erb(:index)
end

get '/transactions' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:"transaction/show")
end
