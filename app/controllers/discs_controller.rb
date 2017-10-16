class DiscsController < AuthenticatedController
  before_action :set_disc, except: [:index, :new, :wishlist, :shelf, :more_shelf, :for_sale]

  def index
    disc_amount = current_user.discs.length
    if disc_amount < 5
      notice = flash.notice
      redirect_to recommendation_wizard_index_path, notice: "#{notice} Add #{5 - disc_amount} movies to get started!"
    else
      @discs = Disc.includes(:movie).where(user_id: current_user.id).limit(20).where(hidden: nil)
    end
  end

  def show
  end

  def own
    @disc.update owns: true
    redirect_to movie_path(@disc.movie)
  end

  def hide
    @disc.update hidden: DateTime.new
    redirect_to discs_path
  end

  def edit
  end

  def create
    @disc = Disc.new(user: current_user, movie: @movie)
    respond_to do |format|
      if @disc.save
        format.html { redirect_to movie_path(@movie), notice: 'Disc was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @disc.update(disc_params)
        format.html { redirect_to movie_path(@movie), notice: 'Disc was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @disc.destroy
    respond_to do |format|
      format.html { redirect_to discs_url, notice: 'Disc was successfully destroyed.' }
    end
  end

  def for_sale
    @discs = Disc.where(user_id: current_user.id).where(hidden: nil).where.not(dvd_id: nil)
  end

  def wishlist
    @discs = Disc.where(user_id: current_user.id, owns: false).where(hidden: nil)
  end

  def shelf
    @discs = Disc.where(user_id: current_user.id, owns: true).where(hidden: nil)
  end

  def more_shelf
    @discs = Disc.where(user_id: current_user.id, owns: true).where(hidden: nil)
    @discs = @discs.page(params[:page]).per(5)
  end

  private

  def set_disc
    @disc = Disc.find(params[:id])
    if @disc.user != current_user
      redirect_to discs_url
    end
  end
end
