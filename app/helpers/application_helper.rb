module ApplicationHelper
  def user_notifications
    Notification.where(user_id: current_user.id).limit(10)
  end

  def notification_link(notification)
    object = notification.object
    if object.is_a? Dvd
      movie = object.card.movie
      link_to movie.title , movie_path( movie)
    else
      "unknown type#{object.class}"
    end
  end
  def notification_image(notification)
    object = notification.object
    if object.is_a? Dvd
      image_tag object.card.movie.poster(:thumb) , class: 'img-fluid'
    else
      "unknown type#{object.class}"
    end
  end
end
