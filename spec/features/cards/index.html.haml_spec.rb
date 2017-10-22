
RSpec.describe "cards/index" do
  before(:each) do
    @cards = create_list(:card, 10, user: sign_user_in)
    visit cards_path
  end

  it 'index page has link to the shelf page' do
    expect(page).to have_link(nil, href: shelf_my_path)
  end

  it 'index page has link to the wishlist page' do
    expect(page).to have_link(nil, href: wishlist_cards_path)
  end

  it "the empty index page works" do
    expect(current_path).to eq cards_path
  end

  it "the index page has links to recommendations" do
    expect(page).to have_link(nil, href: recommendations_index_path)
  end
end

describe 'cards/index' do
  before(:each) do
    user = sign_user_in
    @card = create(:card, user: user)
    visit movie_path(@card.movie)
  end

  it 'index page has link to the sale list page' do
    expect(page).to have_link(nil, href: sale_list_movie_path(@card.movie))
  end

end
