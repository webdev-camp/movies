RSpec.describe "navbar" do

  before(:each) do
    @user = sign_user_in
  end

  it 'allows a user to search for a movie' do
    fill_in('q_title_cont', with: "toy story")
    find('#nav-search-button').click
    expect(page).to have_content('Search results')
  end

end
