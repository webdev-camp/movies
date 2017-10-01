class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :bio
      t.attachment :picture
      t.timestamps
    end
  end
end
