require 'pry'

winners = []
losers = []
standings = []
games = [
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 35,
    away_score: 34
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 59,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 45
  },
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 70,
    away_score: 3
  },
   {
    home_team: "Patriots",
    away_team: "Miami",
    home_score: 42,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Miami",
    home_score: 6,
    away_score: 27
  }

]

# These two blocks will figure out who won the game and add their name to a list in either the winners or losers array.
# Later we can count the names in each array to figure out the number of wins or losses each team had.
games.each do |games|
  if games[:home_score] > games[:away_score]
    winners << games[:home_team]
else 
    winners << games[:away_team]
end
end


games.each do |games|
  if games[:home_score] > games[:away_score]
    losers << games[:away_team]
else 
  losers << games[:home_team]
end
end

#This block counts the number of times each team name appears in the winners and losers arrays.
#It then takes those values and adds it to a hash with the corresponding team name. That hash is then added to an array.
games.each do |team|
  standings << {team_name: team[:home_team], wins: winners.count(team[:home_team]), losses: losers.count(team[:home_team])}
  standings << {team_name: team[:away_team], wins: winners.count(team[:away_team]), losses: losers.count(team[:away_team])}
end

#If a team plays three games then the above block will enter that team 3 times into standings so it needs to be trimmed down

standings = standings.uniq

#The standings now need to be sorted into order by wins first. 
#If the teams have the same amount of wins they will be sorted by losses
def sort(standings)
   (0...standings.length-1).each do |i|
      if standings[i][:wins] < standings[i+1][:wins] 
        standings[i], standings[i+1] = standings[i+1], standings[i]
        sort(standings)
      end
      if standings[i][:wins] == standings[i+1][:wins] && standings[i][:losses] > standings[i+1][:losses]
          standings[i], standings[i+1] = standings[i+1], standings[i]
          sort(standings)
      end
    end
    standings
end

sort(standings)

get '/' do
   @standings = standings
   erb :standings
 end
# standings.each do |standings| 
#  puts "#{standings[:team_name]} #{standings[:wins]} - #{standings[:losses]}"
# end

# games.each do |team|
 
#   winpercentage = 0.00
#   losses = losers.count(team[:home_team])
#   wins = winners.count(team[:home_team])
#   games = losses + wins

 
#       winpercentage = wins.to_f / games.to_f


#   puts winpercentage 
#   puts team[:home_team]

#end








