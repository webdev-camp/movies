class AddColumnNameToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :tmdb_id, :integer
    add_column :people, :imdb_id, :string
    add_column :people, :birthday, :date
    add_column :people, :born_in, :string
  end
end
