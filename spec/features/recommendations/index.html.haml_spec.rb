RSpec.describe "recommendations/index" do
  before (:each) do
    @movies = create_list(:movie, 10)
    @user = sign_user_in
    visit recommendations_index_path
  end

  it 'goes to recommendation page' do
    expect(page).to have_content('Recommendations')
  end

  xit 'adds a recommendation to wishlist for the user', js: true do
    link = recommendations_create_path(@movies.first)
    first('.movie-actions').click_link(nil, href: link)

    expect(page).not_to have_content(@movies.first.title)
  end

  xit 'adds a recommendation to shelf for the user' do
    first('.movie-card').click_link('Add to shelf')
    expect(page).to have_content(@movies.title)
  end

  xit 'page will not include movies the user already has' do
    link = first('.movie-card').find_link()
    link.click
    expect(page).not_to have_link(link)
  end
end
