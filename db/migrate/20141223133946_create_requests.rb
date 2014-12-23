class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester_id, null: false
      t.integer :recipient_id, null: false
      t.string  :status, default: "sent"

      t.timestamps
    end
  end
end
