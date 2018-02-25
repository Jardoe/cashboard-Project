require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("../models/merchant.rb")

get "/merchants" do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get "/merchants/:id" do
  @merchant = Merchant.find(params['id'].to_i)
  @transactions = @merchant.transactions
  erb(:"/merchants/show")
end
