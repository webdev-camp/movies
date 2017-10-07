require 'rails_helper'
RSpec.describe "recommendations/index" do
  before (:each) do
    @movie = create_list(:movie, 10)
    sign_user_in
    visit recommendation_wizard_index_path
  end

  it 'goes to recommendation wizard page' do
  end

  it 'adds a movie to shelf for the user' do
    first('.card').click_link('Add to shelf')
    expect(page).to have_content('You have')
  end

end
