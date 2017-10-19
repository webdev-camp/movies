class MoviesController < AuthenticatedController

  def show
    @movie = Movie.find(params[:id])
    @disc = Disc.for_user(current_user).where( movie: @movie).first
  end

  def sale_list
    @movie = Movie.find(params[:id])
    @q = Disc.with_dvd.where(movie_id: @movie.id).ransack(params[:q])
    @discs = @q.result(distinct: true).page params[:page]
  end
end
