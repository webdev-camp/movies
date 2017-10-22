class MyController < AuthenticatedController
  def for_sale
    @cards = Card.visible.with_dvd.for_user(current_user)
  end

  
end
