class GetCastJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    tmcast = Tmdb::Movie.cast(tmdb_id)
    movie = Movie.where(tmdb_id: tmdb_id).first
    return unless movie
    tmcast.each do |tmcast|
      role =  Role.new(cast_id: tmcast.id, person_name: tmcast.name, character_name: tmcast.character, movie_id: movie.id)
      role.save!
      GetPersonJob.perform_later(tmcast.id)
    end
  end
end
