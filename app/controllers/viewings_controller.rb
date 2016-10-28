class ViewingsController < ApplicationController
  before_action :set_movie, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @viewing = Viewing.new
  end

  def create
    @user.viewings.build(viewing_params)
    @user.save
    redirect_to movie_path(@movie)
  end

  private

  def set_movie
    if params[:viewing]
      @movie = Movie.find(params[:viewing][:movie_id])
    else  
      @movie = Movie.find(params[:movie_id])
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def viewing_params
    params.require(:viewing).permit(:movie_id, :user_id, :rating)
  end

end
