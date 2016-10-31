module ViewingsHelper
  def viewed?(movie)
    if current_user
      Viewing.exists?(:user_id => current_user.id, :movie_id => movie.id)
    end
  end

  def view_status(movie)
    if viewed?(movie)
      "(Seen by you)"
    else
      "(Unseen by you)"
    end
  end

  def user_rating(movie)
    movie.viewings.where(user_id: current_user.id).first.rating
  end
  
end
