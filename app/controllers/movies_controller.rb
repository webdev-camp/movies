class MoviesController < AuthenticatedController

  def show
    @movie = Movie.find(params[:id])
    @disc = Disc.where(user: current_user, movie: @movie).first
  end
end
