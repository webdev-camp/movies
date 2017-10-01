json.extract! movie, :id, :title, :summary, :image, :created_at, :updated_at
json.url movie_url(movie, format: :json)
