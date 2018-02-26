require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("../models/merchant.rb")

get "/merchants" do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get "/merchants/new" do
  erb(:"merchants/new")
end

post "/merchants/new" do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to (:'merchants/added')
end

get '/merchants/added' do
  erb(:'merchants/added')
end

get "/merchants/:id" do
  @merchant = Merchant.find(params['id'].to_i)
  @transactions = @merchant.transactions
  erb(:"/merchants/show")
end
