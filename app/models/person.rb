class Person < ApplicationRecord
  validates :name, :bio, presence: true
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/person/picture/:style.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :tmdb_id, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
  has_one :movie, through: :role
end
