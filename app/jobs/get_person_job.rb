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
    person.tmdb_id = tmperson.id
    person.imdb_id = tmperson.imdb_id
    person.birthday = tmperson.birthday
    person.born_in = tmperson.place_of_birth
    person.save!
    roles = Role.where(cast_id: tmperson.id)#roles is all roles where cast:id = tmpersonid
    roles = tmperson.id

    tmperson.each do |tmperson|
      roles =  Role.new(cast_id: tmperson.id, person_name: tmperson.name, character_name: tmperson.character, movie_id: movie.id)
      roles.save!
  end
  end
end
