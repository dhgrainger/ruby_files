# lets see if i can take an ingredients string and break it into an ingredient, a unit, and an amount

require 'pry'

array = [
"1 1⁄2 teaspoons kosher salt",
"1 pound pasta",
"2 tablespoons olive oil",
"1 small onion, diced",
"3 garlic cloves, minced",
"1 bell pepper, stemmed, seeded, and diced",
"1 large carrot, peeled and diced",
"1 pound lean ground pork",
"One 28-ounce can crushed tomatoes",
"1 1⁄2 tablespoons balsamic vinegar",
"1 teaspoon sugar"]
binding.pry
def compare(string)
  amount = []
  string.each do |word|
   amount << word if word.to_f != 0
   binding.pry
  end
end

def convert(array)
  array.each do |ingredient|
    compare(ingredient.split(' '))
  end
end

convert(array)
