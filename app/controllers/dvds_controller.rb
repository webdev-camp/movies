class DvdsController < ApplicationController
  before_action :set_disc

  def new
    @dvd = Dvd.new
  end

  def edit
    @dvd = @disc.dvd
  end

  def create
    @dvd = Dvd.new(review_params)
    respond_to do |format|
      if @dvd.save
        @disc.add_dvd(@dvd)
        format.html { redirect_to disc_path(@disc), notice: 'DVD sale was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @dvd = @disc.dvd
    respond_to do |format|
      if @dvd.update(review_params)
        @disc.add_dvd(@dvd)
        format.html { redirect_to disc_path(@disc), notice: 'DVD sale was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_disc
      @disc = Disc.find(params[:disc_id])
    end

    def review_params
      params.require(:dvd).permit(:price, :condition)
    end
end
