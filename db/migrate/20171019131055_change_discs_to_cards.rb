class ChangeDiscsToCards < ActiveRecord::Migration[5.1]
  def change
    rename_table :discs, :cards
  end
end
