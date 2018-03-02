require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/budget.rb')
require_relative('../models/transaction.rb')
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')

get '/budget' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:"budgets/index")
end

get '/budget/:id' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

post '/budget/:id' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  budget = Budget.new(params)
  budget.update()
  redirect to '/budget'
end

get '/month/:id' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @budget = Budget.find(params['id'].to_i)
  @left = (@budget.amount.to_f)-(@budget.total.to_f)
  @transactions = @budget.transactions
  erb(:"budgets/month")
end
