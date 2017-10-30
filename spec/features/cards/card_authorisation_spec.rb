describe "card/authorisation" do
  before(:each) do
    @user = create(:user_with_5_cards)
    signin(@user.email, @user.password )
  end

  it "doesn't show other users cards" do
    @card = create(:card)
    visit movie_path(@card.movie)
    expect(page).not_to have_link(nil, href: own_movie_path(@card.movie))
  end
end

describe "cards/authorisation" do
  before(:each) do
    sign_user_in
    @cards = create_list(:card, 10)
    visit cards_path
  end

  it "the index page to not have links to other user's card" do
    expect(page).not_to have_link(nil, href: movie_path(@cards.first.movie))
  end
end
