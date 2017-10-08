require 'rails_helper'
RSpec.describe "recommendations/index" do
  before (:each) do
    @movie = create_list(:movie, 10)
    @user = sign_user_in
    visit recommendation_wizard_index_path
  end

  it 'goes to recommendation wizard page' do
  end

  it 'adds a movie to shelf for the user' do
    first('.card').click_link('Add to shelf')
    expect(page).to have_content('You have')
  end

  it 'page will not include discs the user already has' do
    link = first('.card').find_link('Add to shelf')
    link.click
    expect(page).not_to have_link(link)
  end

  it 'should not let the user add duplicate movies' do
    visit recommendation_wizard_create_path(@movie.first)
    visit recommendation_wizard_create_path(@movie.first)
    disc_length = Disc.where(user: @user, movie: @movie.first).length
    expect(disc_length).to be 1
  end

end
