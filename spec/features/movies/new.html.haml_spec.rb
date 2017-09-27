require 'rails_helper'

RSpec.describe "movies/new" do

  def new_movie
    visit new_movie_path
    @movie = build(:movie)
    fill_in(:movie_title, with: @movie.title)
    fill_in(:movie_summary, with: @movie.summary)
  end

  def new_movie_with_avatar
    visit new_movie_path
    @movie = build(:movie_with_avatar)
    fill_in(:movie_title, with: @movie.title)
    fill_in(:movie_summary, with: @movie.summary)
    attach_file('movie_avatar', 'spec/support/fixtures/thumb.jpg')
  end

  it "renders new movie form" do
    visit new_movie_path
  end

  it "goes to show movie page after creating movie" do
    new_movie
    click_button('Create Movie')
    expect(page).to have_content('Movie was successfully created.')
  end

  it 'Creates a movie with an uploaded avatar' do
    new_movie_with_avatar
    click_button('Create Movie')
    expect(page).to have_content('Movie was successfully created.')
  end

  it "Does not create movie with an invaild avatar" do
    visit new_movie_path
    movie = build(:movie_with_avatar)
    fill_in(:movie_title, with: movie.title)
    fill_in(:movie_summary, with: movie.summary)
    attach_file('movie_avatar', 'spec/support/fixtures/invalid.mp3')
    click_button('Create Movie')
    expect(page).to have_content('Please review the problems below:')
  end

  it "sets default image when movie does not specify image" do
    movie = create(:movie)
    expect(movie.avatar).to_not be nil
  end
end
