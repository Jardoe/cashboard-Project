require_relative( "../models/transaction.rb" )
require_relative( "../models/merchant.rb" )
require_relative( "../models/tag.rb" )
require("pry-byebug")

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()

tag1 = Tag.new({"type" => "Clothes"})
tag2 = Tag.new({"type" => "Groceries"})
tag3 = Tag.new({"type" => "Emergency"})
tag4 = Tag.new({"type" => "Monthly"})

tag1.save()
tag2.save()
tag3.save()
tag4.save()

merchant1 = Merchant.new({"name" => "Tesco"})
merchant2 = Merchant.new({"name" => "Spotify"})
merchant3 = Merchant.new({"name" => "H&M"})
merchant4 = Merchant.new({"name" => "Dentist"})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()

transaction1 = Transaction.new({"merchant_id" => merchant1.id, "tag_id" => tag2.id, "amount" => 18.43})
transaction2 = Transaction.new({"merchant_id" => merchant2.id, "tag_id" => tag4.id, "amount" => 9.99})
transaction3 = Transaction.new({"merchant_id" => merchant3.id, "tag_id" => tag1.id, "amount" => 48.98})
transaction4 = Transaction.new({"merchant_id" => merchant4.id, "tag_id" => tag3.id, "amount" => 500})
transaction5 = Transaction.new({"merchant_id" => merchant3.id, "tag_id" => tag1.id, "amount" => 20.00})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()

binding.pry
nil
