var = gets.chomp
var1 = gets.chomp

def multi_table (var, var1)
	array1 = []
	array2 = []
	i = 1
	j = 1
	while i <= var
		array1 << i
		i += 1
	end
	while j <= var1
		array2 << j
		j += 1
	end

v = array1
h = array2

v.each do |i|
	h.each do |x|
	 num = x * i 
	 print "#{num} "
	end
	puts "\n"
end
end

multi_table(1, 4)