class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :actor, :movie

      t.timestamps null: false
    end

    add_index :roles, [:actor_id, :movie_id]
  end
end
