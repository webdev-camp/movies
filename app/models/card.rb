class Card < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :recommendation, required: false
  belongs_to :dvd, required: false
  belongs_to :review, required: false

  scope :visible, -> { where(hidden: nil) }
  scope :owned, -> { where(owns: true)}
  scope :for_user, ->(user) { where(user: user) }
  scope :with_dvd, -> {where.not(dvd_id: nil)}
  def add_dvd(dvd)
    self.dvd = dvd
    self.selling = true if self.dvd.price > 0
    save
  end

  def add_review(review)
    self.review = review
    save
  end

end
