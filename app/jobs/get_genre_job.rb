class GetGenreJob < ApplicationJob
  queue_as :default

  def perform()
    tmgenres = Tmdb::Genre.movie_list
    tmgenres.each do |genre|
      Genre.create!(name: genre.name)
    end
  end

end
