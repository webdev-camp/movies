module MoviesHelper
  def own?(movie)
    Card.for_user(current_user).where( movie: movie).first
  end

  def shelf_link(movie, card)
    if card and !card.owns.blank?
      link_to shelf_my_path do
        image_tag( 'shelf.png', class: 'star', title: "Movie is on shelf")
      end
    else
      link_to own_movie_path(movie) , remote: true , class: "shelf_link" do
        image_tag( 'shelf_plus.png', class: 'star', title: "Add this to shelf if you have watched this")
      end
    end
  end
end
