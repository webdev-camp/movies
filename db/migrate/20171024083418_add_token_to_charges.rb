class AddTokenToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :token, :string
  end
end
