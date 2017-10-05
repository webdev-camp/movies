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
