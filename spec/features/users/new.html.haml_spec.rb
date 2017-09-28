require 'rails_helper'

RSpec.describe "users/new" do

  before(:each) do
    @user = sign_admin_in
  end

  def new_user
    visit new_user_path
    @user = build(:user)
    fill_in(:user_email, with: @user.email)
    fill_in(:user_name, with: @user.name)
    fill_in(:user_password, with: @user.password)
  end

  def new_user_with_avatar
    visit new_user_path
    @user = build(:user_with_avatar)
    fill_in(:user_email, with: @user.email)
    fill_in(:user_name, with: @user.name)
    fill_in(:user_password, with: @user.password)
    attach_file('user_avatar', 'spec/support/fixtures/thumb.jpg')
  end

  it "renders new user form" do
    visit new_user_path
  end

  it "goes to show user page after creating user" do
    new_user
    click_button('Create User')
    expect(page).to have_content('User was successfully created.')
  end

  it 'Creates a user with an uploaded avatar' do
    new_user_with_avatar
    click_button('Create User')
    expect(page).to have_content('User was successfully created.')
  end

  it "Does not create user with an invaild avatar" do
    visit new_user_path
    user = build(:user_with_avatar)
    fill_in(:user_email, with: user.email)
    fill_in(:user_name, with: user.name)
    attach_file('user_avatar', 'spec/support/fixtures/invalid.mp3')
    click_button('Create User')
    expect(page).to have_content('Please review the problems below:')
  end

  it "sets default image when user does not specify image" do
    user = create(:user)
    expect(user.avatar).to_not be nil
  end

end
