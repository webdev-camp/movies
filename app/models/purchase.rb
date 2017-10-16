class Purchase < ApplicationRecord
  belongs_to :dvd
  belongs_to( :buyer , {:class_name => 'User'} )
end
