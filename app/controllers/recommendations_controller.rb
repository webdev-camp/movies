class RecommendationsController < AuthenticatedController
  def index
    @movies = Movie.all.limit(24).order(revenue: :desc)
  end

  def create
    movie = Movie.find(params[:id])
    disc_length = Disc.where(user_id: current_user.id, movie: movie).length
    if disc_length > 0
      notice = "You have already been recommended this movie"
    else
      @disc = Disc.create(user: current_user, movie: movie, owns: false)
      # user_name = TODO Add recommended_by users name to this
      movie_name = movie.title
      notice = "You have added #{movie_name} to wishlist, recommended by ... "
    end
    redirect_to recommendations_index_path, notice: notice
  end

  def shelf
    movie = Movie.find(params[:id])
    disc_length = Disc.where(user_id: current_user.id, movie: movie).length
    if disc_length > 0
      notice = "You already have this movie"
    else
      @disc = Disc.create(user: current_user, movie: movie, owns: true)
      movie_name = movie.title
      notice = "You have added #{movie_name} to your shelf"
    end
    redirect_to recommendations_index_path, notice: notice
  end
end
