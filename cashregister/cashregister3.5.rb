require 'CSV'
require 'pry'

puts "WELCOME TO DOUG'S COFFEE EMPORIUM\n\n"
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
		grand_total << {name: price_list[x]["name"], sku: price_list[x]["SKU"], subtotal: subtotal, quantity: quantity, time: time, cost: cost, profit: profit}
		total(grand_total)
		menu(price_list, grand_total)
end

def total(grand_total)
	total = 0
		grand_total.each do |x|
			total += x[:subtotal]
		end
	puts " Subtotal: $#{sprintf('%.2f', total)}"
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
					complete_sale(price_list, grand_total, total(grand_total))
			when "5"
					read
			else
				puts "Please enter a number 1 - 5\n\n"

				menu(price_list, grand_total)
		end
end

def list(price_list)

	item = 1
	price_list.each do |x|
		puts "#{item}) Add item - $#{sprintf('%.2f', x["retail_price"])} - #{x["name"]}"
		item +=1
	end

	puts "4) Complete Sale"
	puts "5) Close Out Reports"
end

def complete_sale(price_list, grand_total, total)

	write(grand_total)

	puts "===Sales Complete==="

		grand_total.each do |x|
			puts " $#{sprintf('%.2f', x[:subtotal])} - #{x[:quantity]}  #{x[:name]} \n\n"
		end

		total(grand_total)

		puts "How much cash has the customer provided?"

		amount_prov = gets.chomp.to_f

		t = Time.new
		change = amount_prov - total

			if change.to_f < 0
				puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
			else
				puts "You owe the customer: $#{sprintf('%.2f', change)}"
				puts "#{t.strftime("sold at %I:%M %P")}\n\n\n"
				puts "WELCOME TO DOUG'S COFFEE EMPORIUM\n\n"
			end

	grand_total = []

	menu(price_list, grand_total)

end

def read
	reports = []
	profit = []
	revenue =[]

		CSV.foreach('sales.csv', headers: true) do |row|
				reports << row.to_hash
			end

	puts "Enter a date you would like to report for(YYYY-MM-DD)"
	date = gets.chomp
	if /\w\w\w\w\W\w\w\W\w\w/.match(date)
		puts "On #{date} we sold"
	  		reports.each do |hash|
	  			if hash["time"].include?(date)
	  				puts "SKU: #{hash["sku"]}, Name: #{hash["name"]}, Quantity: #{hash["quantity"]}, Revenue: $#{sprintf('%.2f', hash["subtotal"])}, Profit: $#{sprintf('%.2f', hash["profit"])}"
	  				profit << hash["profit"].to_f
	  				revenue << hash["subtotal"].to_f
	  			else
	  				puts "No data available"
	  			end
	  		end
	  	puts
	  	puts "Revenue: $#{sprintf('%.2f',revenue.inject(:+))}"
	  	puts "Profit: $#{sprintf('%.2f', profit.inject(:+))}"
	else
		puts "Thats not the right date format"
		reports = []
		read
	end
end

def write (grand_total)

	unless File.exists?('sales.csv')
			CSV.open('sales.csv', 'ab'){|csv| csv << grand_total.first.keys}
		end

	CSV.open('sales.csv', 'ab') do |csv|
		 grand_total.each do |hash|
		 	csv << hash.values
		end
	end
end

menu(price_list, grand_total)



