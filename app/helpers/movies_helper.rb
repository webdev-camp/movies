module MoviesHelper
  def own?(movie)
    Card.for_user(current_user).where( movie: movie).first
  end
end
