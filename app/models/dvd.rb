class Dvd < ApplicationRecord
  validates :condition, presence: true
  validates :price, :numericality => true
            # :format => { :with => /^\d{1,4}(\.\d{0,2})?$/ }
end
