class GetCrewJob < ApplicationJob
  queue_as :default

  def perform
    tmcrew = Tmdb::Job.list
    tmcrew = Tmdb::Movie.crew(tmdb_id)
    
    tmcrew.each do |crew|
      person =  Person.new(crew_id: tmcrew.id, person_name: tmcrew.name, movie_id: movie.id)
      person.save!
    end
  end
end
