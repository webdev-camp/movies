class RecommendationWizardController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = Movie.all.limit(12).order(tmdb_vote: :desc)
  end

  def create
    @disc = Disc.new
    @disc.user = current_user
    @disc.movie = Movie.find(params[:id])
    @disc.save!
    movies = Disc.where(user: current_user).length
    redirect_to recommendation_wizard_index_path, notice: "You have #{movies} movies"
  end
end
