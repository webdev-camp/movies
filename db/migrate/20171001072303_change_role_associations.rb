class ChangeRoleAssociations < ActiveRecord::Migration[5.1]
  def change
    remove_column :roles, :person_id
    remove_column :roles, :movie_id
    remove_reference :roles, :movie_id, foreign_key: true
    remove_reference :roles, :person_id, foreign_key: true
    add_reference :roles, :movie, foreign_key: true
    add_reference :roles, :person, foreign_key: true
  end
end
