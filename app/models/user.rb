class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :viewings
  has_many :movies, through: :viewings
  attr_accessor :seen_movies

  def seen_movies
    # self.viewings.each do |viewing|

    # end
    # self.seen_movies = self.viewings.all

    # for each viewing we need to get the movie_id
    # then we should return a collection of movie instances found by those movie_ids
    # that way we can type movie.title instead of viewing.movie.title in the views
    self.seen_movies = self.viewings.collect { |viewing| viewing.movie }
  end

end
