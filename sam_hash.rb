require 'csv'
require 'pry'
file = 'lackp_starting_rosters.csv'
 
# Create an empty teams hash
teams = {}
 
# Open up the CSV and save it to the variable csv
csv = CSV.open(file, headers: true)
 
# Iterate through the CSV and create a hash that looks like teams = {'Simpson Slammers' => {'players' => {}}}
csv.each do |row|
  team_name = row['team']
  teams[team_name] = {'players' => {}}
end
 
# You need to do this so that you start from the top of the CSV again
csv.rewind
 
# Iterate over the csv one more time and fill in the players data with the key being the full name
# Set the value for full_name to be the players information
csv.each do |row|
  full_name = row['first_name'] + ' ' + row['last_name']
  team_name = row['team']
  teams[team_name]['players'][full_name] = {'position' => row['position']}
end
 
### Drills!!!
 
# List all the members of the Jetson Jets
# What team does Lois Griffin play for
# How many total players are there in the league
# List all the pitchers in the league
# Find every player with the surname Rubble