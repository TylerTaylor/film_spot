class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
  belongs_to :director
  has_many :ratings

  validates :title, presence: true

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
end
