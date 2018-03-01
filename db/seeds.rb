require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/category.rb" )
require_relative( "../models/budget.rb")
require("pry-byebug")

Transaction.delete_all()
Budget.delete_all()
Category.delete_all()
Merchant.delete_all()


category1 = Category.new({"type" => "Kyber Crystals"})
category2 = Category.new({"type" => "Droids"})
category3 = Category.new({"type" => "Weapons"})
category4 = Category.new({"type" => "Thermal Exhaust Port"})

category1.save()
category2.save()
category3.save()
category4.save()

merchant1 = Merchant.new({"name" => "Geonosis"})
merchant2 = Merchant.new({"name" => "Galen Erso"})
merchant3 = Merchant.new({"name" => "Circarpous V"})
merchant4 = Merchant.new({"name" => "Cymoon 1"})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

budget1 = Budget.new({"amount" => 1000, "month" => "January", "dt" => "21-01-01"})
budget2 = Budget.new({"amount" => 1000, "month" => "February", "dt" => "21-02-02"})
budget3 = Budget.new({"amount" => 1000, "month" => "March", "dt" => "21-03-03"})
budget4 = Budget.new({"amount" => 1000, "month" => "April", "dt" => "21-04-04"})
budget5 = Budget.new({"amount" => 1000, "month" => "May", "dt" => "21-05-05"})
budget6 = Budget.new({"amount" => 1000, "month" => "June", "dt" => "21-06-06"})
budget7 = Budget.new({"amount" => 1000, "month" => "July", "dt" => "21-07-07"})
budget8 = Budget.new({"amount" => 1000, "month" => "August", "dt" => "21-08-08"})
budget9 = Budget.new({"amount" => 1000, "month" => "September", "dt" => "21-09-09"})
budget10 = Budget.new({"amount" => 1000, "month" => "October", "dt" => "21-10-10"})
budget11 = Budget.new({"amount" => 1000, "month" => "Novemebr", "dt" => "21-11-11"})
budget12 = Budget.new({"amount" => 1000, "month" => "December", "dt" => "21-12-12"})

budget1.save()
budget2.save()
budget3.save()
budget4.save()
budget5.save()
budget6.save()
budget7.save()
budget8.save()
budget9.save()
budget10.save()
budget11.save()
budget12.save()


transaction1 = Transaction.new(
  {"merchant_id" => merchant1.id,
   "category_id" => category2.id,
   "budget_id" => budget2.id,
   "amount" => 18.43,
   "dt" => "21-02-22"})

transaction2 = Transaction.new(
  {"merchant_id" => merchant2.id,
   "category_id" => category4.id,
   "budget_id" => budget2.id,
   "amount" => 9.99,
   "dt" => "21-02-02"})

transaction3 = Transaction.new(
  {"merchant_id" => merchant3.id,
   "category_id" => category1.id,
   "budget_id" => budget12.id,
   "amount" => 48.98,
   "dt" => "21-12-22"})

transaction4 = Transaction.new(
  {"merchant_id" => merchant4.id,
    "category_id" => category3.id,
    "budget_id" => budget7.id,
    "amount" => 500,
    "dt" => "22-07-14"})

transaction5 = Transaction.new(
  {"merchant_id" => merchant3.id,
    "category_id" => category1.id,
    "budget_id" => budget5.id,
    "amount" => 20.00,
    "dt" => "21-05-31"})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()

binding.pry
nil
