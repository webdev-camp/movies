class Person < ApplicationRecord
  validates :name, :bio, presence: true
  has_attached_file :picture, styles: { thumb: "100x150!",
                                      medium: "300x450!",
                                      large: "600X900!"},
                    default_url: "/images/person/picture/:style.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :tmdb_id, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
  has_one :movie, through: :role
  has_many :roles
  has_many :movies, :through => :roles

  def imdb_link
    "http://www.imdb.com/name/#{self.imdb_id}"
  end
  def tmdb_link
    "https://www.themoviedb.org/person/#{self.tmdb_id}"
  end
end
