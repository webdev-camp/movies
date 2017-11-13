class Dvd < ApplicationRecord
  validates :condition, presence: true, if: :price
  validates :price, :numericality => true, if: :condition
  has_one :card
  has_one :purchase
  
end
