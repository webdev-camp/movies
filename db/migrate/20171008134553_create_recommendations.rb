class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.string :recommended_by
    end
    add_reference(:discs, :recommendation)
  end
end
