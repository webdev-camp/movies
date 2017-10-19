module MoviesHelper
  def own?(movie)
    Disc.for_user(current_user).where( movie: movie).first
  end
end
