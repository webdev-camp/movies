RSpec.describe "discs/index" do
  before(:each) do
    @discs = create_list(:disc, 10, user: sign_user_in)
    visit discs_path
  end

  it "the empty index page works" do
    expect(page).to have_content("Home")
  end

  it "the index page has links to disc" do
    expect(page).to have_link(nil, href: disc_path(@discs.first))
  end
end

RSpec.describe "movies/index" do
  before(:each) do
    sign_user_in
    @discs = create_list(:disc, 10)
    visit discs_path
  end

  it "the index page to not have links to other user's disc" do
    expect(page).not_to have_link(nil, href: disc_path(@discs.first))
  end
end
