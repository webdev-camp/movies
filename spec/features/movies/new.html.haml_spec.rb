require 'rails_helper'

RSpec.describe "movies/new" do

  before(:each) do
    sign_admin_in
  end

  def new_movie
    visit new_admin_movie_path
    @movie = build(:movie)
    fill_in(:movie_title, with: @movie.title)
    fill_in(:movie_summary, with: @movie.summary)
  end

  def new_movie_with_poster
    visit new_admin_movie_path
    @movie = build(:movie_with_poster)
    fill_in(:movie_title, with: @movie.title)
    fill_in(:movie_summary, with: @movie.summary)
    attach_file('movie_poster', 'spec/support/fixtures/thumb.jpg')
  end

  it "renders new movie form" do
    visit new_admin_movie_path
  end

  it "goes to show movie page after creating movie" do
    new_movie
    click_button('Create Movie')
    expect(page).to have_content('Movie was successfully created.')
  end

  it 'creates a movie with an uploaded poster' do
    new_movie_with_poster
    click_button('Create Movie')
    expect(page).to have_content('Movie was successfully created.')
  end

  it "does not create movie with an invaild poster" do
    visit new_admin_movie_path
    movie = build(:movie_with_poster)
    fill_in(:movie_title, with: movie.title)
    fill_in(:movie_summary, with: movie.summary)
    attach_file('movie_poster', 'spec/support/fixtures/invalid.mp3')
    click_button('Create Movie')
    expect(page).to have_content('Please review the problems below:')
  end

  it "sets default image when movie does not specify image" do
    movie = create(:movie)
    expect(movie.poster).to_not be nil
  end
end
