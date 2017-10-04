class Dvd < ApplicationRecord
  validates :condition, presence: true, if: :price
  validates :price, :numericality => true, if: :condition
  belongs_to :user
  belongs_to :movie
end
