require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/merchants_controller')


get '/' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  erb(:index)
end
