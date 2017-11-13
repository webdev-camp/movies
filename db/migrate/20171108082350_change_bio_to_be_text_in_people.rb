class ChangeBioToBeTextInPeople < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :bio, :text
  end
end
