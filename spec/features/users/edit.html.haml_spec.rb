require 'rails_helper'

RSpec.describe "users/edit" do
  before(:each) do
    @user = create(:user)
  end

  it "renders the edit user form" do
    visit edit_user_path(@user)
  end
end
