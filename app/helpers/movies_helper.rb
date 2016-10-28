module MoviesHelper
  def user_rating(user, movie)
    rating = user.viewings.where(:movie_id => movie.id).first.rating
    "You've seen this movie and rated it #{rating} " + "star".pluralize(rating) # "1 star" if rating is 1. "5 stars" if rating is 5.
  end
end
