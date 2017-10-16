class AddCastIdToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :cast_id, :integer
  end
end
