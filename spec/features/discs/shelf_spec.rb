describe 'discs' do
  before(:each) do
    user = sign_user_in
    @disc = create(:disc, user: user)
    visit movie_path(@disc.movie)
  end

  it 'adds to shelf link exists' do
    expect(page).to have_link(nil , href: own_disc_path(@disc))
  end

  it 'adds a disc to shelf' do
    click_link(nil , href: own_disc_path(@disc))
    expect(page).to have_link(nil , href: new_disc_dvd_path(@disc))
  end

  it 'forbids adding the same disc twice to shelf' do
    visit own_disc_path(@disc)
    expect(page).to have_link(nil , href: new_disc_dvd_path(@disc))
  end

end
