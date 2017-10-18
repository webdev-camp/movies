RSpec.describe "disc/show" do
  before(:each) do
    user = sign_user_in
    @disc = create(:disc, user: user)
    visit movie_path(@disc.movie)
  end

  it 'shows disc' do
    expect(page).to have_content(@disc.movie.title)
  end

  it 'has a working link to add review' do
    click_link(nil, href: new_disc_review_path(@disc))
    expect(page).to have_content('Review')
  end

  it 'has a working link to add dvd sale' do
    click_link(nil, href: own_disc_path(@disc))
    click_link(nil, href: new_disc_dvd_path(@disc))
    expect(page).to have_content('Sell dvd')
  end

end

describe "disc/show" do
  before(:each) do
    user = sign_user_in
    @disc = create(:disc_for_sale, user: user)
    visit movie_path(@disc.movie)
  end

  it 'has a working link to edit dvd sale' do
    expect(page).to have_link(nil, href: edit_disc_dvd_path(@disc))
  end
end
