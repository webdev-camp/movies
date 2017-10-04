class RemoveAssociationsFromDvd < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:dvds, :user)
    remove_reference(:dvds, :movie)
    add_reference(:discs, :dvd)
  end
end
