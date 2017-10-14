class GetCastJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    tmperson = Tmdb::Person.detail(tmdb_id)
    person = Person.new(tmdb_id: tmdb_id)
    person.name = tmperson.name
    person.bio = tmperson.biography
    person.save!
  end
end
