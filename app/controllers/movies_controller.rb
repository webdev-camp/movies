class MoviesController < AuthenticatedController

  def show
    @movie = Movie.find(params[:id])
    @card = Card.for_user(current_user).where( movie: @movie).first
  end

  def sale_list
    @movie = Movie.find(params[:id])
    @q = Card.with_dvd.where(movie_id: @movie.id).ransack(params[:q])
    @cards = @q.result(distinct: true).page params[:page]
  end

  def own
    @movie = Movie.find(params[:id])
    @card = Card.find_or_create_by(movie: @movie, user: current_user)
    @card.update owns: Time.now

    respond_to do |format|
      @card.save
      format.js { render params[:show] ? "own_show" : "own_card" }
    end
  end

  def wish
    @movie = Movie.find(params[:id])
    @card = Card.find_or_create_by(movie: @movie, user: current_user)
    @card.update wish: Time.now

    respond_to do |format|
      @card.save
      format.js { render params[:show] ? "wish_show" : "wish_card" }
    end
  end

  def hide
    @movie = Movie.find(params[:id])
    @card = Card.find_or_create_by(movie: @movie, user: current_user)
    @card.update hidden: DateTime.new

    respond_to do |format|
      @card.save
      format.js { render params[:show] ? "hide_show" : "hide_card" }
    end
  end


end
