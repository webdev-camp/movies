require 'rails_helper'

RSpec.describe "movies/index" do
  before(:each) do
    sign_admin_in
    @movies = create_list(:movie, 10)
    visit movies_path
  end
  it "checks the empty index page works" do
    expect(page).to have_content("Listing")
  end

  it "checks the index page with one movie works" do
    movie = @movies.first
    expect(page).to have_link("Show", href: movie_path(movie))
  end

  it "checks the index page edit link works" do
    movie = @movies.first
    expect(page).to have_link("Edit", href: edit_movie_path(movie))
  end
end
