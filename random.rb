MAX = 1000
NUMBER = 49

while true

  random_guess = rand(1..1000)

  puts "Guess a number between 0 and #{MAX}: #{random_guess}."

  if random_guess.class != Fixnum
    puts "Invalid input, must enter a number between 0 and #{MAX}."
  elsif random_guess < NUMBER
    puts "Too low, try again."
  elsif random_guess > NUMBER
    puts "Too high, try again."
  end

  break if random_guess == NUMBER

end

puts "You guessed the number!"