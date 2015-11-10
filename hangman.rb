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
	end

	def chances
		@word.length - @guesses.length + (@guesses & @word).length
	end

	def display_word
		@word.each do |letter|
			if @guesses.include?(letter)
				print letter
			else
			  print '-'
			end
		end
		puts "\n Guess a letter(a-z). Or if your feeling lucky you can guess the word.\nChances left: #{chances}\nMissed Letters: #{@guesses - @word}."
	end

	def prompt_guess
		display_word
		@guesses << gets.chomp
		if !(@word & @guesses).empty?
			winner?
		else
			loser?
		end
	end

	def winner?
		if (@word & @guesses) == @word.uniq
			puts " #{@word.join('')} YOU WIN!!!!!"
		else
			prompt_guess
		end
	end

	def loser?
		if chances > 0
			prompt_guess
		else
			puts " #{@word.join('')} you lose WOMMMP WOMMMPPP WOMMMMPPPP WOMMMMMPPPPMPMPMPMP (Sad Trombone)"
		end
	end
end

hangman = Hangman.new

hangman.prompt_guess
