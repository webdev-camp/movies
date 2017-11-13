class ReviewsController < AuthenticatedController
  before_action :set_card , except: [:new]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @movie = Movie.find(params[:card_id])
    @card = Card.find_or_create_by(movie: @movie, user: current_user)
    if @card.review
      redirect_to edit_card_review_path(@card)
    else
      @review = Review.new
    end
  end

  def edit
    @review = @card.review
  end

  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        @card.add_review(@review)
        format.html { redirect_to movie_path(@card.movie), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @review = @card.review
    respond_to do |format|
      if @review.update(review_params)
        @card.add_review(@review)
        format.html { redirect_to movie_path(@card.movie), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
    end
  end

  private
    def set_card
      @card = Card.find(params[:card_id])
    end

    def review_params
      params.require(:review).permit(:plot_score, :plot_comment, :acting_score, :acting_comment)
    end
end
