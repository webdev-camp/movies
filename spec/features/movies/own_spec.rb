RSpec.describe "own/spec" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card, user: @user)
    visit movie_path(@card.movie)
  end

  it 'saves a movie to the shelf' do
    click_link(nil, href: own_movie_path(@card.movie))
    expect(page).to have_content(@card.movie.title)
  end


  it 'has a working link to add review' do
    click_link(nil, href: new_card_review_path(@card))
    expect(page).to have_content('Review')
  end

end
