RSpec.describe "own/spec" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card, user: @user)
    visit movie_path(@card.movie)
  end

  it "My Movie Shelf link goes to user's movie shelf" do
    click_link(nil, href: shelf_my_path)
    expect(page).to have_content('Shelf')
  end

  it "Adds a movie to user's shelf" do
    click_link(nil , href: own_movie_path(@card.movie))
    expect(page).to have_content(@card.movie.title)
  end

  it 'Forbids adding the same card twice to shelf' do
    visit own_movie_path(@card.movie)
    expect(page).to have_link(nil , href: new_card_dvd_path(@card))
  end

end
