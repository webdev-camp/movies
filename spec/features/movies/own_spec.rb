RSpec.describe "own/spec", js: true do
  before(:each) do
    @user = sign_user_in
  end

  it "Card link to add movie to shelf" do
    @card = create(:card, user: @user)
    visit movie_path(@card.movie)
    click_link(nil , href: own_movie_path(@card.movie , show: true))
    expect(page).to have_link(nil, href: new_card_dvd_path(@card))
  end

  it "Have link to create new dvd" do
    @card = create(:card, user: @user, owns: Time.now)
    visit movie_path(@card.movie)
    expect(page).to have_link(nil, href: new_card_dvd_path(@card))
  end

  it "Not to have link to create dvd that is already on sale" do
    @card = create(:card, user: @user)
    visit movie_path(@card.movie)
    expect(page).not_to have_link(nil, href: edit_card_dvd_path(@card))
  end

end
