class DvdsController < ApplicationController
  before_action :set_dvd, only: [:show, :edit, :update, :destroy]
  before_action :set_movie

  def index
    @dvd = Dvd.all
  end

  def new
    @dvd = Dvd.create(user: current_user, movie: @movie)
    respond_to do |format|
      format.html { redirect_to movie_path(@movie), notice: 'Added to shelf.' }
    end
  end

  def show
  end

  def create
    @dvd = Dvd.new(review_params)
    @dvd.user = current_user
    @dvd.movie = @movie
    respond_to do |format|
      if @dvd.save
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @dvd }
      else
        format.html { render :new }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dvd
      @dvd = Dvd.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:dvd).permit(:price, :condition)
    end
end
