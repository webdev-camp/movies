class Notification < ApplicationRecord
  validates :user_id, presence: true
  validates :subject, presence: true
  validates :object_id, presence: true
  validates :object_type, presence: true

  belongs_to :object, polymorphic: true
end
