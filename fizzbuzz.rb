def fizzbuzz(n)
 array = []
 (1..n).to_a.each do |x|
   if x % 15 = 0
     array << 'FizzBuzz'
   elsif x % 5 = 0
     array << 'Buzz'
   elsif x % 3 = 0
     array << 'Fizz'
   else
     array << x
   end
  end
  array
end

fizzbuzz(100)
