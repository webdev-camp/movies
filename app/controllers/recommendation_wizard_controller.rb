class RecommendationWizardController < AuthenticatedController
  def index
    disc_ids = Disc.where(user_id: current_user.id).pluck(:movie_id)
    @movies = Movie.where.not(id: disc_ids)
    @movies= @movies.limit(12).order(tmdb_vote: :desc)
  end

  def create
    movie = Movie.find(params[:id])
    disc_length = Disc.where(user_id: current_user.id, movie: movie).length
    if disc_length > 0
      notice = "You already have this movie"
    else
      @disc = Disc.create(user: current_user, movie: movie)
      movies = Disc.where(user: current_user).length
      notice = "You have #{movies} movies"
    end
    redirect_to recommendation_wizard_index_path, notice: notice
  end
end
