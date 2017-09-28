class Person < ApplicationRecord
  validates :name, :bio, presence: true
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/person/picture/:style.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
