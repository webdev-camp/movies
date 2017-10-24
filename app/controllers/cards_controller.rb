class CardsController < AuthenticatedController
  before_action :set_card, except: [:index, :new]

  def index
    card_amount = current_user.cards.length
    if card_amount < 5
      notice = flash.notice
      redirect_to recommendation_wizard_index_path, notice: "#{notice} Add #{5 - card_amount} movies to get started!"
    else
      @cards = Card.visible.includes(:movie).for_user(current_user).limit(20)
    end

    @cards_on_wishlist = Card.visible.for_user(current_user).where( owns: false).order("RANDOM()")

    @cards_for_sale = Card.visible.owned.for_user(current_user).where(selling: true)

    card_ids = Card.where(user_id: current_user.id).pluck(:movie_id)
    @movies = Movie.where.not(id: card_ids)
    @movies = @movies.order(revenue: :desc).page(params[:page])
  end

  def show
  end

  def own
    @card.update owns: true
    redirect_to movie_path(@card.movie)
  end

  def hide
    @card.update hidden: DateTime.new
    redirect_to cards_path
  end

  def edit
  end

  def create
    @card = Card.new(user: current_user, movie: @movie)
    respond_to do |format|
      if @card.save
        format.html { redirect_to movie_path(@movie), notice: 'Card was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to movie_path(@movie), notice: 'Card was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
    end
  end



  private

  def set_card
    @card = Card.find(params[:id])
    if @card.user != current_user
      redirect_to cards_url
    end
  end
end
