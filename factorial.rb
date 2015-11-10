var1 = gets.chomp.to_i

def factorial num
  
  if num < 0
  
  	return 'you can\'t take the factorial of a negative number!'
	
  end
  
  if num <= 1 
  
    1

  else
  
    num * factorial(num-1)
	
  end
end

puts factorial(var1)