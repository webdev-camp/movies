class AddWistlistToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :wish, :date
    change_column :cards, :selling, :date
    change_column :cards, :owns, :date
  end
end
