def solution(keys, default_value)
  x = {}
  keys.each do |key|
    x[key] = default_value
  end
  puts x
end

array = [1, 2, 3, 4]
value = "nil"

solution(array, value)
