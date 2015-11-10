require 'CSV'
require 'pry'
price_list = []
grand_total = []

CSV.foreach('products.csv', headers: true) do |row|
	price_list << row.to_hash
end

def selection(menu, price_list, grand_total)
		puts "How many?"
		x = menu.to_i - 1
		quantity = gets.chomp.to_i
		subtotal = quantity * price_list[x]["retail_price"].to_f
		name = price_list[x]["name"]
		time = Time.new
		grand_total << {subtotal: subtotal, quantity: quantity, name: name, time: time}
		total(grand_total)
		menu(price_list, grand_total)
		
=begin
	File.open('sales.csv', 'a+') do |f|
				f.puts grand_total
			end=end
=end

end

def total(grand_total)
	total = 0
		grand_total.each do |x|
			total += x[:subtotal]
		end
	puts "Subtotal: $#{sprintf('%.2f', total)}"
	total
end

def menu(price_list, grand_total)
puts "Make a selection:"
menu = gets.chomp
	case menu
		when "1"
				selection(menu, price_list, grand_total)
		when "2"
				selection(menu, price_list, grand_total)
		when "3"
				selection(menu, price_list, grand_total)
		when "4"
			binding.pry
			puts "===Sales Complete==="
					grand_total.each do |x|
						puts "$#{sprintf('%.2f', x[:subtotal])} - #{x[:quantity]}  #{x[:name]} \n\n" 		
					end
					total(grand_total)
	end	
end

item = 1
price_list.each do |x|
	puts "#{item}) Add item - $#{sprintf('%.2f', x["retail_price"])} - #{x["name"]}"
	item +=1
end

puts "4) Complete Sale"

menu(price_list, grand_total)

puts "How much cash has the customer provided?"
amount_prov = gets.chomp.to_f
t = Time.new
change = amount_prov - total(grand_total)

if change.to_f < 0
	
	puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
else
	puts "You owe the customer: $#{sprintf('%.2f', change)}"
	puts "#{t.strftime("sold at %I:%M %P")}"
end


