require 'rails_helper'

RSpec.describe "users/index" do
  before(:each) do
    sign_admin_in
    @users = create_list(:user, 10)
    visit users_path
  end

  it "checks the empty index page works" do
    expect(page).to have_content("Listing")
  end

  it "checks the index page with one user works" do
    user = @users.first
    expect(page).to have_link("Show", href: user_path(user))
  end

  it "checks the index page edit link works" do
    user = @users.first
    expect(page).to have_link("Edit", href: edit_user_path(user))
  end
end
