class Purchase < ApplicationRecord
  belongs_to :dvd
  belongs_to( :buyer , {:class_name => 'User'} )
  scope :current, -> { where(finalized: nil) }

  def finalize!
    update(finalized: Time.now)
  end
end
