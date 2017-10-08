json.extract! movie, :id, :title, :summary, :poster, :created_at, :updated_at
json.url admin_movie_url(movie, format: :json)
