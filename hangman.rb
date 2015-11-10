#!/usr/bin/env ruby

words = %w(
 random
 india
 america
 cricket
 football
 friday
 sunday
 sausage
 blubber
 pencil
 cloud
 moon
 water
 computer
 school
 network
 hammer
 walking
 violently
 mediocre
 literature
 chair
 two
 window
 cords
 musical
 zebra
 xylophone
 penguin
 home
 dog
 final
 ink
 teacher
 fun
 website
 banana
 uncle
 softly
 mega
 ten
 awesome
 attatch
 blue
 internet
 bottle
 tight
 zone
 tomato
 prison
 hydro
 cleaning
 telivision
 send
 frog
 cup
 book
 zooming
 falling
 evily
 gamer
 lid
 juice
 moniter
 captain
 bonding
 loudly
 thudding
 guitar
 shaving
 hair
 soccer
 water
 racket
 table
 late
 media
 desktop
 flipper
 club
 flying
 smooth
 monster
 purple
 guardian
 bold
 hyperlink
 presentation
 world
 national
 comment
 element
 magic
 lion
 sand
 crust
 toast
 jam
 hunter
 forest
 foraging
 silently
 joshing
 pong
 )

string = words.sample
array = string.split(//)
array2 = []
missed_letters =[]
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
puts "===========WELCOME TO HANGMAN==========="

printGuess(array2)

until chances == 0 || array2.include?("-")==false

	puts "\n Guess a letter(a-z). Or if your feeling lucky you can guess the word.\n Chances left: #{chances} Missed Letters: #{missed_letters}.\n "
	letter = gets.chomp.to_s

	if letter.length == 1
		if array.include?(letter)
			y = 0
			array.each do |x|
				if x == letter
					array2[y] = letter
				end
				y+=1
			end
			printGuess(array2)
		else
			chances -= 1
			missed_letters << letter
			printGuess(array2)
		end

		if array2.include?("-")==false
			puts "\n    YOU WIN!!!!!"
		end
	end

	if letter.length > 1
		if letter == string
			puts string
			puts "      YOU WIN!!!!!"
			break
		else
			chances = 0
		end
	end


end

if chances == 0
	puts "\n sorry you lose the word was #{string}"
end

puts "==========THANKS FOR PLAYING=========="
