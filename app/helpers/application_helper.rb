module ApplicationHelper
  def wishlist
    Disc.where(user_id: current_user.id, owns: false).where(hidden: nil)
  end

  def shelf
    Disc.where(user_id: current_user.id, owns: true).where(hidden: nil)
  end
end
