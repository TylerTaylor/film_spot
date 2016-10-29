class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    if params[:director_id]
      @director = Director.find(params[:director_id])
      @movies = @director.movies
    else
      @movies = Movie.all
    end
  end

  def new
    # binding.pry
    @movie = Movie.new
    @director = @movie.build_director
    # binding.pry
    5.times do
      @movie.actors.build
    end
    # binding.pry
    if params[:director_id]
      @director = Director.find(params[:director_id])
    end
  end

  def create
    # binding.pry
    @movie = Movie.new(movie_params)
    @director = Director.find_by(name: params[:movie][:director_attributes][:name])
    # binding.pry
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

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director_attributes => [:name], :actors_attributes => [:name])
  end

end
