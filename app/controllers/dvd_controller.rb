class DvdController < ApplicationController

  def show
  end

  def index
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
