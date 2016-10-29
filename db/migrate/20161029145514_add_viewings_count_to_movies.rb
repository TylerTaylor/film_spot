class AddViewingsCountToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :viewings_count, :integer, default: 0
  end
end
