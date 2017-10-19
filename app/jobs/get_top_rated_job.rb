class GetTopRatedJob < ApplicationJob
    queue_as :default

    def perform
      top_movies = Tmdb::Movie.top_rated
      top_movies.results.each do |top_movie|
        GetMovieJob.perform_later(top_movie.id)
      end
    end
end
