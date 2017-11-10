class Genre < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true
  has_many :movies
end
