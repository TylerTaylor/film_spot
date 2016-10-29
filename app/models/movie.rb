class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
  belongs_to :director
  has_many :viewings
  alias_attribute :viewers, :users # calling movie.viewers is more natural than .users
  has_many :users, :through => :viewings
  # has_many :ratings, :through => :viewings

  validates_presence_of :title, :director

  def director_attributes=(director_attribute)
    # binding.pry
    # self.build_director(director_attribute)
    self.director = Director.where(:name => director_attribute[:name]).first_or_create
  end

  def actors_attributes=(actors_attributes)
    # actor_attributes = [
    #   0 => {"name"=>"Steve Buscemi"}
    #   1 => {"name"=>"Tim Roth"}
    # ]
    actors_attributes.each do |i, actor_attributes|
      self.actors.build(actor_attributes)
    end
  end

  def self.most_viewed
    binding.pry
  end
  

end
