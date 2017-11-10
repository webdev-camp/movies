class GetGenreJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    tmgenre = Tmdb::Movie.movie_list
    genre = Genre.where(tmdb_id: tmdb_id)
    genre.id = tmgenre.id
    genre.name = tmgenre.name
    genre.save!
    genres = Genre.where(id: tmgenre.id, name: tmgenre.name)
    genres.each do |genre|
      genre.join(',')
      genre.save
  end
end
