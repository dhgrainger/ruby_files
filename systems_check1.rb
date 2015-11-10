
test_scores =  [100,
75,
85,
12,
6,
65,
84,
87,
95]

def average(test_scores)
	amount = 0
		test_scores.each do |x|
			amount += x.to_i
		end
	average = amount/test_scores.length
end

def sort(test_scores)
	 (0...test_scores.length-1).each do |i|
	    if test_scores[i] > test_scores[i+1]
	      temp = test_scores[i]
	      temp2 = test_scores[i+1]
	      test_scores[i] = temp2
	      test_scores[i+1] = temp
	      sort(test_scores)
	    end
	   end
	 test_scores
end

sort(test_scores)
length = test_scores.length - 1
 puts test_scores.reverse
# puts "The average score for this test was #{average(test_scores)}.
# The lowest score was #{test_scores[0]}.
# The highest score was #{test_scores[length]}."

