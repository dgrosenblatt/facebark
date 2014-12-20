class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :body
      t.string :user_id

      t.timestamps
    end
  end
end
