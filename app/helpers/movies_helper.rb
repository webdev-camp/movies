module MoviesHelper
  def own?(movie)
    Disc.where(user: current_user, movie: movie).first
  end
end
