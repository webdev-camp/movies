RSpec.describe "movies/index" do
  before(:each) do
    sign_user_in
    @movie = create(:movie)
    visit movie_path(@movie)
  end
  it 'shows movie' do
    expect(page).to have_content(@movie.title)
  end
  it 'has a working link to add review' do
    click_link('Add a Review')
    expect(page).to have_content('New review')
  end
end
