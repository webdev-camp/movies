require 'rails_helper'

RSpec.describe "movies/edit" do

  it 'allows an admin to access the admin pages' do
    sign_admin_in
    visit admin_movies_path
    expect(page).to have_current_path(admin_movies_path)
  end

  it 'does not allow users without admin privileges to access admin pages' do
    sign_user_in
    visit admin_movies_path
    expect(page).to have_current_path(recommendation_wizard_index_path)
  end

  end
