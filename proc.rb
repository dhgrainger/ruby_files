def compose(proc1, proc2)
  sequence = Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end

square_it = Proc.new do |x|
  x * x
end

double_it = Proc.new do |x|
 x + x
end

square_than_double_it = compose(square_it, double_it)

puts square_than_double_it.call(5)
