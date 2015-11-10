require_relative 'political_action.rb'
require 'pry'

groups = []
CSV.foreach('analysis.csv', headers: true) do |row|
	groups << PACGroup.new(
		total_recieved = 0
		if !row["tot_rec"].nil?
			# need the gsub because of dollars and commas
			total_recieved = row["tot_rec"].gsub(/\$/,"").gsub(/\,/, "").to_f
		end

		total_disbursed = 0
		if !row["tot_rec"].nil?
			# need the gsub because of dollars and commas 
			total_disbursed = row["tot_dis"].gsub(/\$/,"").gsub(/\,/, "").to_f
		end

		row["Com_nam"],
		total_disbursed
		total_recieved
		)
end

