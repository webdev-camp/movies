class GetMovieJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    return if Movie.where(tmdb_id: tmdb_id).exists?
    tm = Tmdb::Movie.detail(tmdb_id)
    movie = Movie.new(tmdb_id: tmdb_id)
    movie.title = tm.title
    movie.summary = tm.overview
    movie.poster_remote_url = "https://image.tmdb.org/t/p/original/" + tm.poster_path
    movie.save!
    GetCastJob.perform_later(tmdb_id)
  end
end
