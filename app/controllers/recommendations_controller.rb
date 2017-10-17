class RecommendationsController < AuthenticatedController
  def index
    disc_ids = Disc.where(user_id: current_user.id).pluck(:movie_id)
    @movies = Movie.where.not(id: disc_ids)
    @movies = @movies.all.limit(25).order(revenue: :desc)
  end

  def create
    add_to_shelf(owns: false)
  end

  def shelf
    add_to_shelf(owns: true)
  end

  private

  def add_to_shelf(options)
    owns = options[:owns]
    @movie = Movie.find(params[:id])
    disc_length = Disc.where(user_id: current_user.id, movie: @movie).length
    if disc_length > 0
      redirect_to recommendations_index_path
    else
      @disc = Disc.create(user: current_user, movie: @movie, owns: owns)
    end
  end

end
