class MoviesController < AuthenticatedController

  def show
    @movie = Movie.find(params[:id])
    @card = Card.for_user(current_user).where( movie: @movie).first
  end

  def sale_list
    @movie = Movie.find(params[:id])
    @q = Card.with_dvd.where(movie_id: @movie.id).ransack(params[:q])
    @cards = @q.result(distinct: true).page params[:page]
  end

  def wishlist

  end
end
