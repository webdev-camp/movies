class Review < ApplicationRecord
  validates :plot_score, :plot_comment,
            :acting_score, :acting_comment, :summary, presence: true
  validates :plot_score, :acting_score, numericality:{ only_integer: true,
                                                      greater_than_or_equal_to: 0,
                                                      less_than_or_equal_to: 100 }
  validates :plot_comment, :acting_comment, length: {minimum: 3, maximum: 240}
  validates :summary, length: {minimum: 3, maximum: 720}
  validates :movie_id, uniqueness: { scope: :user_id, message: "You've reviewed this movie!" }

  belongs_to :user
  belongs_to :movie

end
