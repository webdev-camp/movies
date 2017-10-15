class Address < ApplicationRecord
  belongs_to :user
  validates :street, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
