require 'rails_helper'

RSpec.describe "movies/edit" do
  before(:each) do
    sign_admin_in
    @movie = create(:movie)
    visit edit_admin_movie_path(@movie)
  end
  it "test movie can update information" do
    fill_in('movie_title', with: 'movie title')
    fill_in('movie_summary', with: 'movie summary')
    click_button('Update Movie')
    expect(page).to have_content('Movie was successfully updated.')
  end

  it "will not save an invalid summary and title update" do
    fill_in('movie_title', with: '')
    fill_in('movie_summary', with: '')
    click_button('Update Movie')
    expect(page).to have_content('Please review the problems below')
  end
end
