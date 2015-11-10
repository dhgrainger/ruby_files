array = []


while true 
	puts "What\'s the sale price?"
	num = gets.chomp

	if num == "done"
		break
	else
		array << num.to_f
	end
end

var1 = array.reduce(:+)



puts "Subtotal: $#{sprintf('%.2f', var1.abs)}"
puts "How much cash has the customer provided?"
amount_prov = gets.chomp.to_f
t = Time.new

change = amount_prov - var1

if change.to_f < 0
	puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
else
	puts "You owe the customer: $#{sprintf('%.2f', change)}"
	puts "#{t.strftime("sold at %I:%M %P")}"
end