class RecommendationsController < AuthenticatedController
  def index
    disc_ids = Disc.for_user(current_user).pluck(:movie_id)
    @movies = Movie.where.not(id: disc_ids)
    @movies = @movies.order(revenue: :desc).page(params[:page])
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
    disc_length = Disc.for_user(current_user).where( movie: @movie).length
    if disc_length > 0
      redirect_to recommendations_index_path
    else
      @disc = Disc.create(user: current_user, movie: @movie, owns: owns)
    end
  end

end
