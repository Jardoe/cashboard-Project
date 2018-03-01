require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category.rb')
require_relative('../models/budget.rb')



get '/categories' do
  @budgets = Budget.all()
  @categories = Category.all()
  erb(:"categories/index")
end

get "/categories/new" do
  @budgets = Budget.all()
  erb(:"categories/new")
end

post "/categories/new" do
  @budgets = Budget.all()
  category = Category.new(params)
  category.save()
  redirect to (:'categories/added')
end

get '/categories/added' do
  @budgets = Budget.all()
  erb(:'categories/added')
end


get '/categories/:id' do
  @budgets = Budget.all()
  @category = Category.find(params['id'].to_i)
  @transactions = @category.transactions
  erb(:"categories/show")
end
