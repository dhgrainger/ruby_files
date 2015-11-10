class Television
	def initialize(brand, price, size)
		@brand = brand
		@price = price
		@size = size
	end

	def brand
       @brand
  	end

   def price 
    @price
  end

   def size
    @size
  end
end

class Channel
	def initialize(station, number, genre)
		@station = station
		@number = number
		@genre = genre
	end

	def station
       @station
  	end

   def number 
    @number
  end

   def genre
    @genre
  end
end


class Show
	def initialize(station, time, cast = [])
		@name = name
		@time = time
		@cast = cast
	end

	def name
       @name
  	end

   def time 
    @time
  end

   def cast
    @cast
  end
end

dougs_tv = Television.new("sony", 100, 42)

family_guy = Show.new("fx", "9:00pm", ["brian", "peter", "stewey"])

puts family_guy.cast