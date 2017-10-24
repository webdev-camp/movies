module ApplicationHelper
  def wishlist
    Card.visible.for_user(current_user).where( owns: false).limit(4)
  end

  def shelf
    Card.visible.owned.for_user(current_user)
  end
end
