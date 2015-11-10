#Distance between points 

x = rand(1..1000)
y = rand(1..1000)

x1 = rand(1..1000)
y1 = rand(1..1000)

difx = (x-x1)**2
dify = (y-y1)**2
diftot = difx + dify
distance = (((x-x1)**2)+((y-y1)**2))**(0.5)
puts difx
puts dify
puts "The distance between #{x},#{y} and #{x1},#{y1} is #{distance}"

