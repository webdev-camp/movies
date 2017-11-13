class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :object_type
      t.integer :object_id
      t.string :subject
      t.references :user
      t.timestamps
    end
  end
end
