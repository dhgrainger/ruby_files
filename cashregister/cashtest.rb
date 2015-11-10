require 'CSV'
require 'pry'
price_list = []
grand_total = []


CSV.foreach('products.csv', headers: true) do |row|
	price_list << row.to_hash
end

def iterate (price_list)
	