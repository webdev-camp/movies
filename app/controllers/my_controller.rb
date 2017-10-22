class MyController < AuthenticatedController
  def for_sale
    @cards = Card.visible.with_dvd.for_user(current_user)
  end

  def shelf
    @cards = Card.visible.owned.for_user(current_user)
  end

  def wishlist
    @cards = Card.visible.for_user(current_user).where( owns: false)
    @q = Card.with_dvd.ransack(params[:q])
    @cards = @q.result(distinct: true).page params[:page]
  end

  def more_shelf
    @cards = current_user.shelf.page(params[:page]).per(4)
  end
end
