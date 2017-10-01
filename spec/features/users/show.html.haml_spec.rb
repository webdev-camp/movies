require 'rails_helper'

feature "users/show" do
  before(:each) do
    @user = sign_admin_in
    visit admin_user_path(@user)
  end

  it "shows a user" do
    expect(current_path).to eq(admin_user_path(@user))
  end
end
