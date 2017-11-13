RSpec.describe "hiding cards" do
  before(:each) do
    user = sign_user_in
    @card = create(:card, user: user)
    visit movie_path(@card.movie)
  end

  it "the hide card button shows" do
    expect(page).to have_link(nil, href: hide_movie_path(@card.movie, show: true))
  end

  
end
