class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :red, :read
  end
end
