def check_currency(input)
	puts input
	if /\d.\d\d/.match(input) 
		puts "true"
	end
end

var1 = gets.chomp
check_currency(var1)