require 'rails_helper'

RSpec.describe "users/edit" do
  before(:each) do
    @user = create(:user)
    visit edit_user_path(@user)
  end

  it "test user can update information" do
    fill_in('user_email', with: 'test@test.com')
    fill_in('user_name', with: 'edited user')
    fill_in(:user_password, with: @user.password)
    click_button('Update User')
    expect(page).to have_content('User was successfully updated.')
  end

  it "will not save an invalid name and email update" do
    fill_in('user_email', with: '')
    fill_in('user_name', with: '')
    click_button('Update User')
    expect(page).to have_content('Please review the problems below')
  end
end
