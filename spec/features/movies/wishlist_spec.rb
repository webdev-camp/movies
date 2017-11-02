RSpec.describe "wishlist/spec", js: true do
  before(:each) do
    @user = sign_user_in
  end

  it "Card link to add movie to wishlist" do
    @card = create(:card, user: @user , owns: Time.now)
    visit shelf_my_path(@card.movie)
    click_link(nil , href: wish_movie_path(@card.movie))
    expect(page).to have_link(nil, href: shelf_my_path)
  end

  it "Expect movie on wishlist have right notice on hover" do
    @card = create(:card, user: @user , owns: Time.now)
    visit shelf_my_path(@card.movie)
    page.has_no_content?("Add this to shelf if you've watched this")
  end
end
