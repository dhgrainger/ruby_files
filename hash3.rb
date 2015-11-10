movies = {rambo: 3,
rocky: 3,
rockyIV: 4}

puts "Write something you jabroni"
choice = gets.chomp

case choice
when "add"
   
    puts "Whats one of your favorite movies?"
    title = gets.chomp
    puts "And How would you rate that on a 0-4 scale?"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i

when "update"
    puts "what movies do you want to update?"
    title = gets.chomp
    if movies[title.to_sym] == false
        puts "movie not found"
    else
        puts "what is the new rating?"
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i
        puts "Now #{title} is rated #{rating}"
end
when "display"
    movies.each {|title, rating| puts "#{title}: #{rating}"}
when "delete"
    puts "What movie do you want to delete?"
    if movies[title.to_sym] == nil
    puts "That movie never existed why do you think I call you                jabroni"
    else
        title = gets.chomp
        movies.delete(title)
end
else
    "Error!"
end
