numeral = []

num = gets.chomp.to_i

while (num > 0 && num < 10000)
if num > 1000
  numeral.push("M")
  num -= 1000
elsif num >= 500
  numeral.push("D")
  num -= 500
elsif num >= 100 
  numeral.push("C")
  num -= 100
elsif num >= 50
  numeral.push("L")
  num -= 50
elsif num >= 10 
  numeral.push("X")
  num -= 10
elsif num >= 5
  numeral.push("V")
  num -= 5
elsif num >= 0 
  numeral.push("I")
  num -= 1
end
end
puts numeral.join('')
  