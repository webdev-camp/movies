class Card < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :recommendation, required: false
  belongs_to :dvd, required: false
  belongs_to :review, required: false
  scope :visible, -> { where(hidden: nil) }
  scope :wishlist, -> { visible.where.not(wish: nil) }
  scope :owned, -> { visible.where.not(owns: nil)}
  scope :for_user, ->(user) { where(user: user) }
  scope :with_dvd, -> {where.not(dvd_id: nil)}
  scope :hidden, -> { where.not(hidden: nil)}
  has_many :notifications, as: :object
  
  def add_dvd(dvd)
    self.dvd = dvd
    self.selling = Time.now if self.dvd.price > 0
    save
  end

  def add_review(review)
    self.review = review
    save
  end

end
