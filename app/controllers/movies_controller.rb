class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :movies_viewed_by_user]
  before_action :find_user, only: [:movies_viewed_by_user]

  def index
    # binding.pry
    if params[:director_id]
      @director = Director.find(params[:director_id])
      @movies = @director.movies
    else
      @movies = Movie.all
    end
  end

  def new
    @movie = Movie.new
    @director = @movie.build_director
    5.times do
      @movie.actors.build
    end

    if params[:director_id]
      @director = Director.find(params[:director_id])
    end
  end

  def create
    @movie = Movie.new(movie_params)
    @director = Director.find_by(name: params[:movie][:director_attributes][:name])
    if @movie.save
      redirect_to movie_path(@movie)
    else
      # redirect_to(:back, :flash => { :error => @movie.errors.full_messages })
      # redirect_to new_director_movie_path(@director), :flash => { :error => @movie.errors.full_messages }
      render "new", location: new_director_movie_path(@director)
    end
  end

  def show
  end

  def most_viewed_movies
    @most_viewed_movies = Movie.most_viewed
  end

  def movies_viewed_by_user
    if @user
      @movies_viewed_by_user = @user.seen_movies
    else
      redirect_to new_user_session_path
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to movies_path
  end

  def movie_params
    params.require(:movie).permit(:title, :director_attributes => [:name], :actors_attributes => [:name])
  end

end
