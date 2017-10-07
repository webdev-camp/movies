describe 'discs' do
  before(:each) do
    user = sign_user_in
    @disc = create(:disc, user: user)
    visit disc_path(@disc)
  end
  it 'adds to shelf link exists' do
    expect(page).to have_content('I own this')
  end
  it 'adds a disc to shelf' do
    click_link('I own this')
    expect(page).to have_content('Sell this')
  end

  it 'forbids adding the same disc twice to shelf' do
    visit own_disc_path(@disc)
    expect(page).to have_content('Sell this')
  end

end
