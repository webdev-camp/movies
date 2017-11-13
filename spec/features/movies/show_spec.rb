RSpec.describe "movie/show" do
  before(:each) do
    user = sign_user_in
    @card = create(:card, user: user)
    visit movie_path(@card.movie)
  end

  it 'has a working link to add review' do
    click_link(nil, href: new_card_review_path(@card))
    expect(page).to have_content('Review')
  end

end

describe "movie/show" do
  before(:each) do
    user = sign_user_in
    @card = create(:card_for_sale, user: user)
    visit movie_path(@card.movie)
  end

  it 'has a working link to edit dvd sale' do
    expect(page).to have_link(nil, href: edit_card_dvd_path(@card))
  end
end
