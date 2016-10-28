class Viewing < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  # has_one :rating
end
