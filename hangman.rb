string = "incredulous"
array = string.split(//)
array2 = []
chances = array.length
x = 0	
	
	while x < array.length 
		array2 << "-"
		x +=1
	end
	
	def printGuess(array2)
		array2.each do |x|
			print x
		end
	end

	

printGuess(array2)

until chances == 0 || array2.include?("-")==false
	
	puts "\n Guess a letter(a-z). Chances left: #{chances}. 
	  Or if your feeling lucky you can guess the word"
	letter = gets.chomp

	if letter.length == 1
		if array.include?(letter)
			array2[array.index(letter)] = letter
				printGuess(array2)
		else
			chances -= 1
			printGuess(array2)
		end	
		
		if array2.include?("-")==false
			puts "\n YOU WIN!!!!!"
		end
	end

	if letter.length > 1
		if letter == string
			puts string
			puts "YOU WIN!!!!!"
			break
		else
			chances = 0
		end
	end


end

if chances == 0
	puts "sorry you lose"
end

