puts "What is the amount due?"
amount_due = gets.chomp.to_f
puts "How much cash has the customer provided?"
amount_prov = gets.chomp.to_f
t = Time.new

change = amount_prov - amount_due

if change.to_f < 0
	
	puts "The customer still owes $#{sprintf('%.2f', change.abs)}"
else
	puts "You owe the customer: $#{sprintf('%.2f', change)}"
	puts "#{t.strftime("sold at %I:%M %P")}"
end