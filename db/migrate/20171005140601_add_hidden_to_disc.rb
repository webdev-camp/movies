class AddHiddenToDisc < ActiveRecord::Migration[5.1]
  def change
    add_column :discs, :hidden, :date
  end
end
