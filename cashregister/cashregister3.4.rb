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
		time = Time.new
		cost = quantity * price_list[x]["wholesale_price"].to_f
		profit = subtotal - cost
		grand_total << {subtotal: subtotal, quantity: quantity, name: price_list[x]["name"], time: time, sku: price_list[x]["SKU"], cost: cost, profit: profit}
		total(grand_total)
		menu(price_list, grand_total)			
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
list(price_list)
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
				complete_sale(price_list, grand_total)
		when "5"
				reports = []
				CSV.foreach('sales.csv', headers: true) do |row|
  					reports << row.to_hash
  				end
  				puts "enter the date(mm"
		else 
			puts "\nPlease enter a number 1 - 5\n"
			menu(price_list, grand_total)	
	end	
end

def list(price_list)
	item = 1
	puts "WELCOME TO DOUG'S COFFEE EMPORIUM\n\n"
	price_list.each do |x|
		puts "#{item}) Add item - $#{sprintf('%.2f', x["retail_price"])} - #{x["name"]}"
		item +=1
	end

	puts "4) Complete Sale"
	puts "5) Reports"
end

def complete_sale(price_list, grand_total)
		unless File.exists?('sales.csv')
			CSV.open('sales.csv', 'ab'){|csv| csv << grand_total.first.keys}
		end

		CSV.open('sales.csv', 'ab') do |csv|
			 grand_total.each do |hash|
			 	csv << hash.values
			end 	
		end
	
			puts "===Sales Complete==="
					grand_total.each do |x|
						puts "$#{sprintf('%.2f', x[:subtotal])} - #{x[:quantity]}  #{x[:name]} \n\n" 		
					end
					total(grand_total)
					puts "How much cash has the customer provided?"
					amount_prov = gets.chomp.to_f
					t = Time.new
					change = amount_prov - total(grand_total)

					if change.to_f < 0
						puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
					else
						puts "You owe the customer: $#{sprintf('%.2f', change)}"
						puts "#{t.strftime("sold at %I:%M %P")}\n\n\n"
					end
					menu(price_list, grand_total)	
end

menu(price_list, grand_total)



