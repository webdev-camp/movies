class Person < ApplicationRecord
  validates :name, presence: true
  has_attached_file :picture, styles: { thumb: "100x150!",
                                      medium: "300x450!",
                                      large: "600X900!"},
                    default_url: "/images/person/picture/:style.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates :tmdb_id, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
  has_many :roles, -> {includes :movie}
  has_many :movies, :through => :roles

  attr_reader :picture_remote_url

  def picture_remote_url=(url_value)
    self.picture = URI.parse(url_value)
    @picture_remote_url = url_value
  end

  def imdb_link
    "http://www.imdb.com/name/#{self.imdb_id}"
  end
  def tmdb_link
    "https://www.themoviedb.org/person/#{self.tmdb_id}"
  end
end
