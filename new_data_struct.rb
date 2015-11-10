#require 'sinatra'
require 'CSV'
require 'pry'

teams = {}

 def read
  
    CSV.foreach('lackp_starting_rosters.csv', headers: true) do |row|
      teams.store(row.to_hash["team"], row.to_hash.values)
    end
  teams
 binding.pry
end
binding.pry
read
