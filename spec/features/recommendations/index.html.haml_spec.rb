require 'rails_helper'

RSpec.describe "recommendations/index" do
  before (:each) do
    @movie = create_list(:movie, 10)
    @user = sign_user_in
    visit recommendations_index_path
  end

  it 'goes to recommendation page' do
  end

  it 'adds a recommendation to shelf for the user' do
    first('.card').click_link('Add to wishlist')
    expect(page).to have_content('You have')
  end

  it 'page will not include movies the user already has' do
    link = first('.card').find_link('Add to wishlist')
    link.click
    expect(page).not_to have_link(link)
  end
end
