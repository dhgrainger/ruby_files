array = []
x = 0
while x < 5
	puts "enter name"
	name = gets.chomp
	puts "enter price"
	price = gets.chomp.to_i
	puts "enter number"
	number = gets.chomp.to_i
	x += 1
	array << {name: name, price: price, number: number}
end

puts array