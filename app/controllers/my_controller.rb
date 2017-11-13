class MyController < AuthenticatedController
  def for_sale
    @cards = Card.visible.with_dvd.for_user(current_user)
  end

  def shelf
    @cards = Card.visible.owned.for_user(current_user)
  end

  def wishlist
    @q = Card.wishlist.for_user(current_user).ransack(params[:q])
    @cards = @q.result(distinct: true).page params[:page]
  end

  def more_shelf
    @cards = current_user.shelf.page(params[:page]).per(4)
  end

  def hidden_list
    @cards = Card.hidden.for_user(current_user)
  end

end
