puts "Enter a number and lets see if i can guess it"
num = gets.chomp.to_i
max = 1000
arr = []

while true
	random = rand(1..1000)
	if random == num
		puts "#{random}!? Ha got you!"
		break
	elsif random.class != Fixnum
		puts "Invalid entry"
	elsif random < num
		puts "#{random}? too low? Ill guess again"
		arr << random
	elsif random > num
		puts "#{random}? too high? I'll guess again"
		arr << random
	end
end	
		
if arr.length > 1000
	puts "#{arr.length} guesses? You suck!!"
end
