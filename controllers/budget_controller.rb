require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/budget.rb')
require_relative('../models/transaction.rb')
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')

get '/budget' do
  @budgets = Budget.all()
  erb(:"budgets/index")
end

get '/budget/:id' do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

post '/budget/:id' do
  budget = Budget.new(params)
  budget.update()
  redirect to '/budget'
end

get '/month/:id' do
  @transactions = Transaction.all()
  @budget = Budget.find(params[:id])
  erb(:"budgets/month")
end
