movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 3,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
good_movies = Hash.new
good_movies = movie_ratings.select { |movies, rating| rating > 3}
good_movies.each_key {|x| puts x}
