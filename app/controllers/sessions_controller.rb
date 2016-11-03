class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = u.password_confirmation = SecureRandom.urlsafe_base64(n=6)
    end
    session[:user_id] = user.id
    binding.pry 
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end

end
