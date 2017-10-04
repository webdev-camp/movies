module MoviesHelper
  def own?(movie)
    Dvd.where(user: current_user, movie: movie).first
  end
end
