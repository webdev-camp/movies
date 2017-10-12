class MoviesController < AuthenticatedController

  def show
    @movie = Movie.find(params[:id])
    @disc = Disc.where(user: current_user, movie: @movie).first
  end

  def sale_list
    @movie = Movie.find(params[:id])
    @discs = Disc.where(movie_id: @movie.id).where.not(dvd_id: nil)
  end
end
