class RecommendationsController < AuthenticatedController
  def index
    card_ids = Card.for_user(current_user).pluck(:movie_id)
    @movies = Movie.where.not(id: card_ids)
    @movies = @movies.order(revenue: :desc).page(params[:page])
  end

  def make
    add_to_shelf(wish: Time.now)
  end

  def shelf
    add_to_shelf(owns: Time.now)
  end

  private

  def add_to_shelf(options)
    @movie = Movie.find(params[:id])
    card_length = Card.for_user(current_user).where( movie: @movie).length
    if card_length > 0
      redirect_to recommendations_path
    else
      @card = Card.create({user: current_user, movie: @movie}.merge(options))
    end
  end

end
