class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :plot_score
      t.string :plot_comment
      t.integer :acting_score
      t.string :acting_comment
      t.string :summary

      t.timestamps
    end
  end
end
