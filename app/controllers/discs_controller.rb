class DiscsController < ApplicationController
  before_action :set_movie

  def show
  end

  def new
    unless @disc
      @disc = Disc.create(user: current_user, movie: @movie, owns: true)
    end
    redirect_to movie_path(@movie)
  end

  def edit
  end

  def create
    @disc = Disc.new(disc_params)
    @disc.user = current_user
    @disc.movie = @movie
    respond_to do |format|
      if @disc.save
        format.html { redirect_to movie_path(@movie), notice: 'Disc was successfully created.' }
        format.json { render :show, status: :created, location: @disc }
      else
        format.html { render :new }
        format.json { render json: @disc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @disc.update(disc_params)
        format.html { redirect_to movie_path(@movie), notice: 'Disc was successfully updated.' }
        format.json { render :show, status: :ok, location: @disc }
      else
        format.html { render :edit }
        format.json { render json: @disc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disc.destroy
    respond_to do |format|
      format.html { redirect_to discs_url, notice: 'Disc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:movie_id])
      @disc = Disc.where(user: current_user, movie: @movie).first
    end

    def disc_params
      params.require(:disc).permit(:plot_score, :plot_comment, :acting_score, :acting_comment, :summary)
    end
end
