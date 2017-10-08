class Admin::MoviesController < AuthenticatedController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true).order(:title).page params[:page]
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movie_path(@movie), notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to admin_movie_path(@movie), notice: 'Movie was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.' }
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :summary, :poster, :language, :imdb_id, :tmdb_id, :tmdb_vote, :revenue, :budget)
    end
end
