class AddPersonToRole < ActiveRecord::Migration[5.1]
  def change
    add_reference :roles, :person_id, foreign_key: true
  end
end
