require 'rails_helper'

RSpec.describe "users/show" do
  before(:each) do
    @user = create(:user)
  end

  it "renders show page" do
    visit user_path(@user)
  end
end
