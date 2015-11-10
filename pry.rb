require 'pry'


def sum(numbers)
	numbers.each do |number|
		if sum == 0
			sum = number.to_i
		else
			sum += number.to_i
		end
	end
	sum
end

binding.pry

numbers = [1,2,3,4,5,6,7,8]

puts sum(numbers[0..numbers.length])