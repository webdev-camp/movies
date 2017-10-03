class RecommendationsController < ApplicationController
  def index
    @movies = Movie.all.limit(6).order(tmdb_vote: :desc)
  end
end
