module ApplicationHelper
  def wishlist
    Disc.visible.for_user(current_user).where( owns: false)
  end

  def shelf
    Disc.visible.owned.for_user(current_user)
  end
end
