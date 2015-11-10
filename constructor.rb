class Car
  def initialize(color, owner, cylinders)
    @color = color
    @owner = owner
    @cylinders = cylinders
  end

  def color
    @color
  end

  def owner
    @owner
  end

  def cylinders
    @cylinders
  end

end

#create a Car instance that represents Dan's black 4-cylinder car
dans_car = Car.new('black', 'Dan', 4)

#create a Car instance that represents Mark's red 6-cylinder car
marks_car = Car.new('red', 'Mark', 6)

puts dans_car.owner
puts dans_car.cylinders
puts dans_car.color