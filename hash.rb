puts "Enter something you jabroni:"

text = gets.chomp
words = text.split

frequencies = Hash.new(0)

words.each do |x| frequencies[x] +=1
end   
frequencies = frequencies.sort_by {|a, b| b}
frequencies.reverse!
frequencies.each do |x, y|
    puts x + " " + y.to_s
end