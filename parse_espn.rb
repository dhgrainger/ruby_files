require 'open-uri'
require 'nokogiri'

#Go to espn nfl lines and open the doc
doc = Nokogiri::HTML(open('http://espn.go.com/nfl/lines'))

#Group the data by games. Every 7th row is a new game after filtering.
doc.css('tr').reject{|x| x['class'] == "colhead" || x['class'].nil?}.each_slice(7).to_a.each do |game|
  #the first of the 7 rows will always be the title including time of game
  title = game.shift.css('td').text
  teams = title.split('-').first.split(' at ')

  info = []

  # Instead of averaging lines from across each of the 5 providers we just take the first one since they are all similar
  # this line selects the spread
  info << game[0].css('td')[1].text.split(':').first.to_f
  # In the case the spread is even, the over under might be in index 2 spot or index 4
  # luckily if it is in the 4 then the 2 will be the spread again so we can normalize by calling uniq
  info << game[0].css('td')[2].text.to_f
  info << game[0].css('td')[4].text.to_f

  #spit out the game followed by the spread applied to the over under
  puts title
  puts "#{teams[0]}: #{((info.uniq[1]/2) - (info[0]/2)).round}"
  puts "#{teams[1]}: #{((info.uniq[1]/2) + (info[0]/2)).round}"
end
