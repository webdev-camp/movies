RSpec.describe "movies/index" do
  before(:each) do
    sign_user_in
    @movies = create_list(:movie, 10)
    visit movies_path
  end
  it "the empty index page works" do
    expect(page).to have_content("Home")
  end
end
