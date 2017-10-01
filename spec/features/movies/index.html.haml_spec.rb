require 'rails_helper'

RSpec.describe "movies/index" do
  before(:each) do
    sign_admin_in
    @movies = create_list(:movie, 10)
    visit admin_movies_path
  end
  it "the empty index page works" do
    expect(page).to have_content("Listing")
  end

  it "the index page with one movie works" do
    movie = @movies.first
    expect(page).to have_link("Show", href: admin_movie_path(movie))
  end

  it "the index page edit link works" do
    movie = @movies.first
    expect(page).to have_link("Edit", href: edit_admin_movie_path(movie))
  end
end
