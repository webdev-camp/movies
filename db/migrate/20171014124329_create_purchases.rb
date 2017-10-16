class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :buyer_id
      t.references :dvd, foreign_key: true
      t.datetime :finalized
      t.timestamps
    end
  end
end
