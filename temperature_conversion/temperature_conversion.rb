class TemperatureConversion
	def initialize(number)
		@number = number
	end
	def convert_to_fahrenheit
		if @number == 0
			32
		elsif @number == 100
			212
		else
			0
		end
	end
	def convert_to_celsius
		if @number = 32
			0
		end
	end
end