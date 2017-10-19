RSpec.describe "hiding cards" do
  before(:each) do
    user = sign_user_in
    @card = create(:card, user: user)
    visit movie_path(@card.movie)
  end
  it "the hide card button shows" do
    expect(page).to have_link("Hide", href: hide_card_path(@card))
  end
end
