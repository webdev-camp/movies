describe 'cards' do
  before(:each) do
    user = sign_user_in
    @card = create(:card, user: user)
    visit movie_path(@card.movie)
  end

  it 'adds to shelf link exists' do
    expect(page).to have_link(nil , href: own_card_path(@card))
  end

  it 'adds a card to shelf' do
    click_link(nil , href: own_card_path(@card))
    expect(page).to have_link(nil , href: new_card_dvd_path(@card))
  end

  it 'forbids adding the same card twice to shelf' do
    visit own_card_path(@card)
    expect(page).to have_link(nil , href: new_card_dvd_path(@card))
  end

end
