RSpec.describe "movies/index" do
  before(:each) do
    sign_user_in
    @discs = create_list(:disc, 10)
    visit discs_path
  end
  it "the empty index page works" do
    expect(page).to have_content("Home")
  end
end
