class Disc < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :recommendation, required: false
  belongs_to :dvd, required: false
  belongs_to :review, required: false

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
