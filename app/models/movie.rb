class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
  has_many :directors
  has_many :ratings
end
