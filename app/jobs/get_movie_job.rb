class GetMovieJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    return if Movie.where(tmdb_id: tmdb_id).exists?
    tm = Tmdb::Movie.detail(tmdb_id)
    movie = Movie.new(tmdb_id: tmdb_id)
    movie.title = tm.title
    movie.summary = tm.overview
    movie.budget = tm.budget
    movie.language = tm.original_language
    movie.revenue = tm.revenue
    movie.release_date = tm.release_date
    movie.poster_remote_url = "https://image.tmdb.org/t/p/original/" + tm.poster_path
    movie.genre = tm.genres.collect{|g|g.name}.join(",")
    movie.save!
    GetCastJob.perform_later(tmdb_id)
  end
end
