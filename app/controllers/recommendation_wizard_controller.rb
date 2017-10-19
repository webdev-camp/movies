class RecommendationWizardController < AuthenticatedController
  def index
    card_ids = Card.for_user(current_user).pluck(:movie_id)
    @movies = Movie.where.not(id: card_ids)
    @movies= @movies.limit(12).order(tmdb_vote: :desc)
  end
 
  def create
    movie = Movie.find(params[:id])
    card_length = Card.for_user(current_user).where( movie: movie).length
    if card_length > 0
      notice = "You already have this movie"
    else
      @card = Card.create(user: current_user, movie: movie)
      movies = Card.where(user: current_user).length
      notice = "You have #{movies} movies"
    end
    redirect_to recommendation_wizard_index_path, notice: notice
  end
end
