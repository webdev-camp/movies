describe "disc/authorisation" do
  before(:each) do
    @user = create(:user_with_5_discs)
    signin(@user.email, @user.password )
  end

  it "doesn't show other users discs" do
    @disc = create(:disc)
    visit disc_path(@disc)
    expect(current_path).to eq discs_path
  end
end

describe "discs/authorisation" do
  before(:each) do
    sign_user_in
    @discs = create_list(:disc, 10)
    visit discs_path
  end

  it "the index page to not have links to other user's disc" do
    expect(page).not_to have_link(nil, href: disc_path(@discs.first))
  end
end
