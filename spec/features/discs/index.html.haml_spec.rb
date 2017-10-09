RSpec.describe "discs/index" do
  before(:each) do
    @discs = create_list(:disc, 10, user: sign_user_in)
    visit discs_path
  end

  it "the empty index page works" do
    expect(current_path).to eq discs_path
  end

  it "the index page has links to recommendations" do
    expect(page).to have_link(nil, href: recommendations_index_path)
  end
end
