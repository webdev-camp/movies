module MoviesHelper
  def own?(movie)
    Card.for_user(current_user).where( movie: movie).first
  end

  def own_link(movie, card)
    if card and !card.owns.blank?
      link_to shelf_my_path do
        image_tag( 'shelf.png', class: 'star', title: "Movie is on shelf")
      end
    else
      link_to own_movie_path(movie) , remote: true , class: "own_link" do
        image_tag( 'shelf_plus.png', class: 'star', title: "Add this to shelf if you've watched this")
      end
    end
  end

  def wish_link(movie, card)
    if card and !card.wish.blank?
      link_to wishlist_my_path, remote: true, class: "wish_link" do
        image_tag( 'wishlist.png', class: 'star', title: "Now on wishlist")
      end
    else
      link_to wish_movie_path(movie), remote: true , class: "wish_link" do
        image_tag( 'wish_plus.png' , class: 'star' , title: "Add to wishlist")
      end
    end
  end

  def hide_link(movie, card)
    if card and !card.hidden.blank?
      link_to hidden_list_my_path, remote: true, class: "hide_link" do
        image_tag( 'hide_text.png', class: 'card-icon', title: "Movie hidden")
      end
    else
      link_to hide_movie_path(movie), remote: true , class: "hide_link" do
        image_tag( 'hide_text.png' , class: 'card-icon' , title: "Hide this movie")
      end
    end
  end
end
