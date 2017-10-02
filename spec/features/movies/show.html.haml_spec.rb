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

  it "displays the movie title" do
    expect(page).to have_content( "Title: #{@movie.title}")
  end

  it "displays the movie summary" do
    expect(page).to have_content("Summary: #{@movie.summary}")
  end

  it "displays the movie language" do
    expect(page).to have_content("Language: #{@movie.language}")
  end

  it "displays the movie's imdb id" do
    expect(page).to have_content("imdb_id: #{@movie.imdb_id}")
  end

  it "displays the movie's tmdb id" do
    expect(page).to have_content("tmdb_id: #{@movie.tmdb_id}")
  end

  it "displays the movie's budget" do
    expect(page).to have_content("Budget: #{@movie.budget}")
  end

  it "displays the movie's revenue" do
    expect(page).to have_content("Revenue: #{@movie.revenue}")
  end
end
