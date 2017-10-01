class AddColumnNameToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :backdrop, :attachment
    add_column :movies, :language, :string
    add_column :movies, :imdb_id, :string
    add_column :movies, :tmdb_id, :integer
    add_column :movies, :release_date, :date
    add_column :movies, :tmdb_vote, :integer
    add_column :movies, :revenue, :integer
    add_column :movies, :budget, :integer
  end
end
