class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.string :dog_name
      t.string :breed
      t.string :interests
      t.string :wall
      t.integer :college_id

      t.timestamps
    end
  end
end
