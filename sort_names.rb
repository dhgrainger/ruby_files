require 'pry'

def sort_reindeer(reindeer_names)
x = {}
reindeer_names.each do |name|

  y = name.split(' ')
  x[y[0]] = y[1]
end
  x = x.sort_by{|k, v| v}
  array = []
  x.each do |k, v|
    array << "#{k} #{v}"
  end
  puts array
end

names = ["lee ransom", "albert deng", "doug grainger"]
sort_reindeer(names)
