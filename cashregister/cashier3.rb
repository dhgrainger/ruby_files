require 'CSV'
require 'pry'
price_list = {}
grand_total = []

CSV.foreach('products.csv', headers: true) do |row|
	price_list << row.to_hash
end


item = 1
price_list.each do |x|
	puts "#{item}) Add item - $#{sprintf('%.2f', x["retail_price"])} - #{x["name"]}"
	item +=1
end
puts "4) Complete Sale"

while true

puts "Make a selection:"
menu = gets.chomp
case menu
when "1"
		puts "How many?"
		quantity = gets.chomp.to_i
		subtotal = quantity * price_list[0]["retail_price"].to_f
		name = price_list[0]["name"]
		puts "Subtotal: $#{sprintf('%.2f', subtotal)}"
		grand_total << {subtotal: subtotal, quantity: quantity, name: name}
		#binding.pry
when "2"
		puts "How many?"
		quantity = gets.chomp.to_i
		subtotal = quantity * price_list[1]["retail_price"].to_f
		name = price_list[1]["name"]
		puts "Subtotal: $#{sprintf('%.2f', subtotal)}"
		grand_total << {subtotal: subtotal, quantity: quantity, name: name}
when "3"
		puts "How many?"
		quantity = gets.chomp.to_i
		subtotal = quantity * price_list[2]["retail_price"].to_f
		name = price_list[2]["name"]
		puts "Subtotal: $#{sprintf('%.2f', subtotal)}"
		grand_total << {subtotal: subtotal, quantity: quantity, name: name}
when "4"
		total = 0
		grand_total.each do |x|
			total += x[:subtotal]
		end
			puts "===Sales Complete==="
			grand_total.each do |x|
				puts "$#{sprintf('%.2f', x[:subtotal])} - #{x[:quantity]}  #{x[:name]} " 		
			end
			puts "Total: $#{sprintf('%.2f', total)}"
			break
end
end


puts "How much cash has the customer provided?"
amount_prov = gets.chomp.to_f
t = Time.new
change = amount_prov - total

if change.to_f < 0
	puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
else
	puts "You owe the customer: $#{sprintf('%.2f', change)}"
	puts "#{t.strftime("sold at %I:%M %P")}"
end
