class RemoveAssociationFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:reviews, :user)
    remove_reference(:reviews, :movie)
    add_reference(:discs, :review)
  end
end
