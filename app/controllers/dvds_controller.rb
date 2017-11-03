class DvdsController < AuthenticatedController
  before_action :set_card, except: [:new]

  def new
    @movie = Movie.find(params[:card_id])
    @card = Card.find_or_create_by(movie: @movie, user: current_user)
    if @card.dvd
      redirect_to edit_card_dvd_path(@card)
    else
      @dvd = Dvd.new
    end
  end

  def edit
    @dvd = @card.dvd
  end

  def create
    @dvd = Dvd.new(review_params)
    respond_to do |format|
      if @dvd.save
        @card.add_dvd(@dvd)
        format.html { redirect_to for_sale_my_path, notice: 'DVD sale was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @dvd = @card.dvd
    respond_to do |format|
      if @dvd.update(review_params)
        format.json {}
        format.html { redirect_to for_sale_my_path, notice: 'DVD sale was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_card
      @card = Card.find(params[:card_id])
    end

    def review_params
      params.require(:dvd).permit(:price, :condition)
    end
end
