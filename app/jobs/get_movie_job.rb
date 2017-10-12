class GetMovieJob < ApplicationJob
  queue_as :default

  def perform(tmdb_id)
    # check if we have the movie, if we do stop. else get data from api,
    # put data from their data into ours, then save. look up paperclip for handling images. 
  end
end
