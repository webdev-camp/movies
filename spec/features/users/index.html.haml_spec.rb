require 'rails_helper'

RSpec.describe "users/index" do
  before(:each) do
    sign_admin_in
    @users = create_list(:user, 10)
    visit admin_users_path
  end

  it "checks the empty index page works" do
    expect(page).to have_content("Listing")
  end

  it "checks the index page with one user works" do
    user = @users.first
    expect(page).to have_link("Show", href: admin_user_path(user))
  end

  it "checks the index page edit link works" do
    user = @users.first
    expect(page).to have_link("Edit", href: edit_admin_user_path(user))
  end
  it 'searches for a person by name' do
    fill_in(:q_name_cont, with: 'john')
    click_button('Search')
    expect(page).to have_content('john')
  end
  it 'searches for a person by email' do
    fill_in(:q_email_cont, with: 'example')
    click_button('Search')
    expect(page).to have_content('example')
  end
end

describe "admin/users/index" do
  before(:each) do
    sign_admin_in
    @users = create_list(:user, 100)
    visit admin_users_path
  end
  it "only shows 25 movies at one time" do
    list = page.all('a', :text => 'Show')
    expect(list.length).to be(25)
  end
end
