class ViewingsController < ApplicationController
  before_action :set_movie, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @viewing = Viewing.new
  end

  def create
    binding.pry
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def viewing_params
    binding.pry
  end

end
