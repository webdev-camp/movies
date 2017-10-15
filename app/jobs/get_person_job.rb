class GetPersonJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    return if Person.where(tmdb_id: tmdb_id).exists?
    tmperson = Tmdb::Person.detail(tmdb_id)
    return if tmperson.profile_path.blank?
    person = Person.new(tmdb_id: tmdb_id)
    person.name = tmperson.name
    person.bio = tmperson.biography
    person.picture_remote_url = "https://image.tmdb.org/t/p/original/" + tmperson.profile_path
    person.save!
  end
end
