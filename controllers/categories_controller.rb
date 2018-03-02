require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category.rb')
require_relative('../models/budget.rb')
require_relative('../models/merchant.rb')

get '/categories' do
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @categories = Category.all()
  erb(:"categories/index")
end

get "/categories/new" do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:"categories/new")
end

post "/categories/new" do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  category = Category.new(params)
  category.save()
  redirect to (:'categories/added')
end

get '/categories/added' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:'categories/added')
end


get '/categories/:id' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @category = Category.find(params['id'].to_i)
  @transactions = @category.transactions
  erb(:"categories/show")
end
