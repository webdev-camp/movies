class Disc < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :dvd, required: false
  belongs_to :review, required: false


  def add_dvd(dvd)
    self.dvd = dvd
    save
  end
  def add_review(review)
    self.review = review
    save
  end

end
