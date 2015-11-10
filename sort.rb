def alphabetize(arr, rev=false)
    
    if rev == true 
      arr.sort.reverse!
    else
      arr.sort! 
    end
    
end

numbers = [1, 2, 3]
var1  = true 
puts alphabetize(numbers, var1)