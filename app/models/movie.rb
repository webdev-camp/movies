class Movie < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/users/avatars/:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aavatar\/.*\z/
end
