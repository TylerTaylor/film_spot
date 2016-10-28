class AddRatingToViewings < ActiveRecord::Migration
  def change
    add_column :viewings, :rating, :integer
  end
end
