class AddViewingIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :viewing_id, :integer
  end
end
