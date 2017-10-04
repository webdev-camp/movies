class DvdsController < ApplicationController
  before_action :set_movie

  def new
    @dvd = Dvd.new
  end

  def edit
    @dvd = @disc.dvd
  end

  def create
    @dvd = Dvd.new(review_params)
    respond_to do |format|
      if @dvd.save
        current_user.add_dvd_for_movie(@dvd, @movie)
        format.html { redirect_to movie_path(@movie), notice: 'DVD sale was successfully created.' }
        format.json { render :show, status: :created, location: @dvd }
      else
        format.html { render :new }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @dvd = @disc.dvd
    respond_to do |format|
      if @dvd.update(review_params)
        current_user.add_dvd_for_movie(@dvd, @movie)
        format.html { redirect_to movie_path(@movie), notice: 'DVD sale was successfully updated.' }
        format.json { render :show, status: :created, location: @dvd }
      else
        format.html { render :new }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:movie_id])
      @disc = @movie.disc(current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:dvd).permit(:price, :condition)
    end
end
