class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :mobile
      t.integer :user_id
      t.string :message
      t.boolean :status, default: false

      t.timestamp
    end
  end
end
