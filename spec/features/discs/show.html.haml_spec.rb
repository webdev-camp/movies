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
    click_link('Add a Review')
    expect(page).to have_content('New review')
  end
end
#when creating disc not for current user should go to disc path must redirect
