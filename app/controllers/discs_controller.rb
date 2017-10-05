class DiscsController < ApplicationController
  before_action :set_disc, except: [:index, :new]

  def index
    @q = Disc.ransack(params[:q])
    @discs = @q.result(distinct: true).page params[:page]
  end

  def show
  end

  def own
    @disc.owns = true
    @disc.save
    redirect_to disc_path(@disc)
  end

  def edit
  end

  def create
    @disc = Disc.new(disc_params)
    @disc.user = current_user
    @disc.movie = @movie
    @disc.review = @review
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
    def set_disc
      @disc = Disc.find(params[:id])
      #disc user is the current user
    end

    def disc_params
      params.require(:disc).permit(:plot_score, :plot_comment, :acting_score, :acting_comment, :summary)
    end
end
