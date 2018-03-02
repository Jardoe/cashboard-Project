require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/budget_controller')


get '/' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @transactions = Transaction.all()
  @total = Transaction.total()
  erb(:index)
end
