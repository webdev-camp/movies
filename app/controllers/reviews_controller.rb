class ReviewsController < AuthenticatedController 
  before_action :set_disc

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    if @disc.review
      redirect_to edit_disc_review_path(@disc)
    else
      @review = Review.new
    end
  end

  def edit
    @review = @disc.review
  end

  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        @disc.add_review(@review)
        format.html { redirect_to disc_path(@disc), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @review = @disc.review
    respond_to do |format|
      if @review.update(review_params)
        @disc.add_review(@review)
        format.html { redirect_to disc_path(@disc), notice: 'Review was successfully updated.' }
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
    def set_disc
      @disc = Disc.find(params[:disc_id])
    end

    def review_params
      params.require(:review).permit(:plot_score, :plot_comment, :acting_score, :acting_comment, :summary)
    end
end
