module ApplicationHelper
  def wishlist
    Card.visible.for_user(current_user).where( owns: false)
  end

  def shelf
    Card.visible.owned.for_user(current_user)
  end
end
