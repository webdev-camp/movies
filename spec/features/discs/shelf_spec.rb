describe 'discs' do
  before(:each) do
    @movie = create(:movie)
    sign_user_in
    visit movie_path(@movie)
  end
  it 'adds to shelf link exists' do
    expect(page).to have_content('I own this')
  end
  it 'adds a disc to shelf' do
    click_link('I own this')
    expect(page).to have_content('Sell this')
  end
end
