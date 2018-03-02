require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("../models/merchant.rb")
require_relative('../models/budget.rb')
require_relative('../models/category.rb')


get "/merchants" do
  @categories = Category.all()
  @budgets = Budget.all()
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get "/merchants/new" do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:"merchants/new")
end

post "/merchants/new" do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  merchant = Merchant.new(params)
  merchant.save()
  redirect to (:'merchants/added')
end

get '/merchants/added' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:'merchants/added')
end

get "/merchants/:id" do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @merchant = Merchant.find(params['id'].to_i)
  @transactions = @merchant.transactions
  erb(:"/merchants/show")
end
