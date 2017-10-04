class Disc < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :dvd, required: false
end
