json.extract! review, :id, :plot_score, :plot_comment, :acting_score, :acting_comment, :created_at, :updated_at
json.url review_url(review, format: :json)
