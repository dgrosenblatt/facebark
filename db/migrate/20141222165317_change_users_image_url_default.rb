class ChangeUsersImageUrlDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :image_url, "http://i.imgur.com/y49qSAj.jpg"
  end
end
