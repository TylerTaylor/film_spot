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
end
