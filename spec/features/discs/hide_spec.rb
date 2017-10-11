RSpec.describe "hiding discs" do
  before(:each) do
    user = sign_user_in
    @disc = create(:disc, user: user)
    visit movie_path(@disc.movie)
  end
  it "the hide disc button shows" do
    expect(page).to have_link("Hide", href: hide_disc_path(@disc))
  end
end
