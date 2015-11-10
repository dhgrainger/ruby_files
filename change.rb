def change(a)
  ('a'..'z').each do |letter|
    if a.include?(letter)
      print 1
    else
      print 0
    end
  end
end

change('physics')
