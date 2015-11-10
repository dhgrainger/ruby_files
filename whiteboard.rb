require'pry'

class Whiteboard
  attr_accessor :contents

  def initialize(contents = [])
    @contents = contents
  end

  def erase 
    @contents = []
  end
end

class DryEraseMarker
  attr_reader :color, :capacity
  def initialize(color)
    @color = color
    @capacity = 100
  end

  def capacity
    @capacity
  end

  INK_USE_PER_CHARACTER = 0.01
  def write(contents, whiteboard)
    @capacity = @capacity - (INK_USE_PER_CHARACTER * contents.length)
    whiteboard.contents << contents
    # binding.pry
  end

  def empty?
    if @capacity == 0
       false
    else
      true
    end
  end
end

whiteboard = Whiteboard.new
black_marker = DryEraseMarker.new('black')

black_marker.write('Hello Launchers', whiteboard)
black_marker.write('My name is Slim Shady', whiteboard)

puts whiteboard.contents.length
whiteboard.erase
puts whiteboard.contents.length
puts black_marker.empty?