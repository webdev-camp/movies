class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(distinct: true).order(:title).page params[:page]
  end

  def show
    @movie = Movie.find(params[:id])
    @disc = @movie.disc(current_user)
  end
end
