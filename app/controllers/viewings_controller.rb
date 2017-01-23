class ViewingsController < ApplicationController
  before_action :set_movie, only: [:new, :create]
  before_action :set_user, only: [:new, :create]

  def new
    @viewing = Viewing.new

    render 'viewings/new', layout: false
  end

  def create
    @user.viewings.build(viewing_params)
    @viewing = @user.viewings.last
    @user.save
    Movie.reset_counters(@movie, :viewings)
    # redirect_to movie_path(@movie)

    respond_to do |format|
      format.json { render json: @viewing }
    end
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
