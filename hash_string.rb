def solution(pairs)
  array = []
  pairs.each {|k, v| array << "#{k} = #{v}"}
  puts array.join(',')
end
pairs = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 2 }
solution(pairs)
