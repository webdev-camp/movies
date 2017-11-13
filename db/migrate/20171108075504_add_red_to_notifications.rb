class AddRedToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :red, :date
  end
end
