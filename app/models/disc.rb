class Disc < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :dvd, required: false

  def add_dvd(dvd)
    self.dvd = dvd
    save
  end
end
