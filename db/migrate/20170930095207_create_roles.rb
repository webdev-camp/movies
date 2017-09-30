class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :person_name
      t.string :character_name
      t.string :person_id
      t.string :movie_id

      t.timestamps
    end
  end
end
