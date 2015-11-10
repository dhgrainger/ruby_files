#!/usr/bin/env ruby
require 'pry'

class Hangman

	def initialize
		@library =
		 %w(
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

		@word = @library.sample.split('')
		@guesses =[]
		@man =[]
	end

	def chances
		@word.length - @guesses.uniq.length + (@guesses & @word).length
	end

	def display_word
		@word.each do |letter|
			if @guesses.include?(letter)
				print letter
			else
			  print '-'
			end
		end
		puts "\n Guess a letter(a-z). Or if your feeling lucky you can guess the word.\nChances left: #{chances}\nMissed Letters: #{@guesses.uniq - @word}."
	end

	def prompt_guess
		hang_man
		display_word
		@guesses << gets.chomp
		if (@word & @guesses) == @word.uniq
			puts " #{@word.join('')} YOU WIN!!! (Triumphant Horns)"
		elsif chances <= 0
			puts " #{@word.join('')} You Lose (Sad Trombone)"
		else
			prompt_guess
		end
	end

	def hang_man
		hang_level = @word.length - chances
		case hang_level
		when  1
			@man[0] = [" ","0"," "]
		when 2
			@man[1] = [" ","|"," "]
		when 3
			@man[1] = [" ","|","\\"]
		when 4
			@man[1] = ["/","|","\\"]
		when 5
			@man[2] = ["/",""," "]
		when 6
			@man[2] =["/"," ","\\"]
		end

		@man.each do |part|
			puts part.join("")
		end
	end
end

hangman = Hangman.new

hangman.prompt_guess

puts "==========THANKS FOR PLAYING=========="
