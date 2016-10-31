class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :viewings
  has_many :movies, through: :viewings
  attr_accessor :seen

  def seen
    # self.viewings.each do |viewing|

    # end
    self.seen = self.viewings.all
  end

end
