class AddSellingToDiscs < ActiveRecord::Migration[5.1]
  def change
    add_column :discs, :selling, :boolean
  end
end
