class RemoveSummaryFromReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :summary
  end
end
