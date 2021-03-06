require( 'sinatra' )
require( 'sinatra/contrib/all' )
require ('pry-byebug')
require_relative( '../models/transaction.rb' )
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')


get '/new' do
  @budgets = Budget.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:"transactions/new")
end

post '/transactions/added' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  transaction = Transaction.new(params)
  transaction.save
  redirect to (:"transactions/added")
end

get '/transactions/added' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:"transactions/added")
end

get '/transactions/:id/edit' do
  @budgets = Budget.all()
  @merchants = Merchant.all()
  @categories = Category.all()
  @transaction = Transaction.find(params[:id])
  erb( :"transactions/edit" )
end

post '/transactions/:id' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  transaction = Transaction.new(params)
  transaction.update()
  redirect to (:'transactions/edited')
end

get '/transactions/edited' do
  @categories = Category.all()
  @budgets = Budget.all()
  erb(:"transactions/edited")
end

get '/transactions/:id/view' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:"transactions/show")
end

get '/transactions/:id/delete?' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/delete?")
end

post '/transactions/:id/delete?' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  Transaction.delete(params[:id])
  redirect to (:"transactions/deleted")
end

get '/transactions/deleted' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:"transactions/deleted")
end

get '/hyperspace' do
  @categories = Category.all()
  @merchants = Merchant.all()
  @budgets = Budget.all()
  erb(:'hyperspace')
end
