class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.integer :user_id
      t.integer :amount
      t.text :description
      t.integer :purchase_id
      t.string :currency
      t.string :stripe_id

      t.timestamps
    end
  end
end
