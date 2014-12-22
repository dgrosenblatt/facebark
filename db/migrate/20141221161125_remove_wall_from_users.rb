class RemoveWallFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :wall
  end
end
