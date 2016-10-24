class Movie < ActiveRecord::Base
  has_many :actors
  has_many :directors
  has_many :ratings
end
