require 'rails_helper'

RSpec.describe "movies/show" do
  before(:each) do
    sign_admin_in
    @movie = create(:movie)
    visit admin_movie_path(@movie)
  end

  it "shows a movie" do
    expect(current_path).to eq(admin_movie_path(@movie))
  end

  it "the movie show page edit link works" do
    expect(page).to have_link("Edit", href: edit_admin_movie_path(@movie))
  end
end
