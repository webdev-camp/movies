class Review < ApplicationRecord
  validates :plot_score, :plot_comment,
            :acting_score, :acting_comment, presence: true
  validates :plot_score, :acting_score, numericality:{ only_integer: true,
                                                      greater_than_or_equal_to: 0,
                                                      less_than_or_equal_to: 10 }
  validates :plot_comment, :acting_comment, length: {minimum: 3, maximum: 240}

  has_one :card
  def string_summary
    "#{plot_score}/#{acting_score}"
  end

end
