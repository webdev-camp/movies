require 'rails_helper'

RSpec.describe "users/show" do
  before(:each) do
    @user = create(:user)
    visit user_path(@user)
  end

  it "shows a user" do
    expect(current_path).to eq(user_path(@user))
  end
end
