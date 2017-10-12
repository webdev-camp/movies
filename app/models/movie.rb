class Movie < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true
  validates :language, length: { maximum: 30}, allow_blank: true
  validates :tmdb_id, :revenue, :budget, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :tmdb_vote, numericality:{ only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_blank: true
  has_attached_file :poster, styles: { thumb: "100x150!",
                                      medium: "200x300!",
                                      large: "300X450!"},
                    default_url: "/images/movies/posters/:style.png"
  validates_attachment_content_type(:poster, content_type: /\image\/.*\z/)
  has_many :roles, -> {includes :person}
  has_many :people, :through => :roles
  has_many :reviews
  has_many :users, through: :reviews
  has_many :discs

  def imdb_link
    "http://www.imdb.com/title/#{self.imdb_id}"
  end
  def tmdb_link
    "https://www.themoviedb.org/movie/#{self.tmdb_id}"
  end
  def review(user)
    Review.where(user: user, movie: self).first
  end
  def disc(user)
    Disc.where(user: user, movie: self).first
  end
end
