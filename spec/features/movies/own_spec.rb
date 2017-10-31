RSpec.describe "own/spec", js: true do
  before(:each) do
    @user = sign_user_in

  end

  it "Have link to create new dvd" do
    @card = create(:card, user: @user, owns: Time.now)
    visit movie_path(@card.movie)
    expect(page).to have_link(nil, href: new_card_dvd_path(@card))
  end

  it "Does not have link to create new dvd" do
    @card = create(:card, user: @user)
    visit movie_path(@card.movie)
    expect(page).not_to have_link(nil, href: new_card_dvd_path(@card))
  end


  it "Adds a movie to user's shelf" do
    @card = create(:card, user: @user)
    visit movie_path(@card.movie)
    click_link(nil , href: own_movie_path(@card.movie , show: true))
    expect(page).to have_link(nil, href: new_card_dvd_path(@card))
  end

end
