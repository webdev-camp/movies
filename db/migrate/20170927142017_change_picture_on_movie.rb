class ChangePictureOnMovie < ActiveRecord::Migration[5.1]
  def self.up
    change_table :movies do |t|
      t.attachment :poster
    end
    remove_attachment :movies, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
    change_table :movies do |t|
      t.attachment :avatar
    end
  end
end
