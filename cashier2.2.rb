t = Time.new
string1 = "What\'s the sale price? (or are you \"done\"?)"
string2 = "How much cash has the customer provided?( or are you \"done\"?)"
amount = 0.0

def check_currency(input)
	if /\d.\d\d/.match(input) 
		true
	end
end

def get_amount(amount, string)
	puts string
	num = gets.chomp
	
	if num == "done"
	elsif check_currency(num) 
		amount += num.to_f
		puts "Subtotal: $#{sprintf('%.2f', amount.abs)}"
		get_amount(amount, string)
	else
		puts "please enter a cash value"
		get_amount(amount, string)
	end
	amount
end

var1 = get_amount(amount, string1)
change = get_amount(amount, string2) - var1

if change.to_f < 0
	puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
else
	puts "You owe the customer: $#{sprintf('%.2f', change)}"
	puts "#{t.strftime("sold at %I:%M %P")}"
end