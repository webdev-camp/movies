RSpec.describe "disc/show" do
  before(:each) do
    user = sign_user_in
    @disc = create(:disc, user: user)
    visit disc_path(@disc)
  end
  it 'shows disc' do
    expect(page).to have_content(@disc.movie.title)
  end
  it 'has a working link to add review' do
    click_link(nil, href: new_disc_review_path(@disc))
    expect(page).to have_content('New review')
  end
end
describe "disc/show" do
  before(:each) do
    user = sign_user_in
  end
  it "doesn't show other users discs" do
    @disc = create(:disc)
    visit disc_path(@disc)
    expect(current_path).to eq discs_path
  end
  end
