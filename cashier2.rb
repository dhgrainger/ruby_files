array = Array.new
t = Time.new

def check_currency(input)
	if /\d.\d\d/.match(input) 
		true
	end
end

def input_amount(array)
	puts "What\'s the sale price? (or are you \"done\"?)"
	num = gets.chomp
	
	if num == "done"
	elsif check_currency(num) 
		array << num.to_f
		input_amount(array)
	else
		puts "please enter a cash value"
		input_amount(array)
	end
	array
end

input_amount(array)

var1 = array.reduce(:+)
puts "Subtotal: $#{sprintf('%.2f', var1.abs)}"

def customer_amount
	
	puts "How much cash has the customer provided?"
	amount_prov = gets.chomp
	if check_currency(amount_prov)
		return amount_prov.to_f
	else
		puts "enter a valid cash value"
		customer_amount
	end
end

var2 = customer_amount.to_f

change = var2 - var1

if change.to_f < 0
	puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
else
	puts "You owe the customer: $#{sprintf('%.2f', change)}"
	puts "#{t.strftime("sold at %I:%M %P")}"
end



