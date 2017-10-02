class Movie < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true
  has_attached_file :poster, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/movies/posters/:style.png"
  validates_attachment_content_type(:poster, content_type: /\image\/.*\z/)
  has_many :roles
  has_many :people, :through => :roles
  has_many :reviews
  has_many :users, through: :reviews
end
