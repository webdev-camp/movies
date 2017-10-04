class RemoveBackdropFromMovies < ActiveRecord::Migration[5.1]
  def up
    remove_attachment :movies, :backdrop
  end

  def down
    add_attachment :movies, :backdrop
  end
end
