class Viewing < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie, counter_cache: true
  # has_one :rating

  validates :rating, presence: :true
end
