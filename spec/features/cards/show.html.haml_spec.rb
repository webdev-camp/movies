RSpec.describe "card/show" do
  before(:each) do
    user = sign_user_in
    @card = create(:card, user: user)
    visit movie_path(@card.movie)
  end

  it 'shows card' do
    expect(page).to have_content(@card.movie.title)
  end

  it 'has a working link to add review' do
    click_link(nil, href: new_card_review_path(@card))
    expect(page).to have_content('Review')
  end

  it 'has a working link to add dvd sale' do
    click_link(nil, href: own_card_path(@card))
    click_link(nil, href: new_card_dvd_path(@card))
    expect(page).to have_content('Sell dvd')
  end

end

describe "card/show" do
  before(:each) do
    user = sign_user_in
    @card = create(:card_for_sale, user: user)
    visit movie_path(@card.movie)
  end

  it 'has a working link to edit dvd sale' do
    expect(page).to have_link(nil, href: edit_card_dvd_path(@card))
  end
end
