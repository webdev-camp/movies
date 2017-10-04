class CreateDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :discs do |t|
      t.references :user
      t.references :movie
      t.boolean :owns

      t.timestamps
    end
  end
end
