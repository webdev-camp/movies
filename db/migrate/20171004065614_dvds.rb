class Dvds < ActiveRecord::Migration[5.1]
  def change
    create_table :dvds do |table|
      table.string :condition
      table.integer :price
      table.references :movie
      table.references :user
      table.timestamps
    end
  end
end
