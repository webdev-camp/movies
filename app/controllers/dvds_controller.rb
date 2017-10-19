class DvdsController < AuthenticatedController
  before_action :set_card

  def new
    @dvd = Dvd.new
  end

  def edit
    @dvd = @card.dvd
  end

  def create
    @dvd = Dvd.new(review_params)
    respond_to do |format|
      if @dvd.save
        @card.add_dvd(@dvd)
        format.html { redirect_to cards_for_sale_path, notice: 'DVD sale was successfully created.' }
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
        format.html { redirect_to cards_for_sale_path, notice: 'DVD sale was successfully updated.' }
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
