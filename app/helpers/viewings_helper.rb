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
end
