require 'rails_helper'

RSpec.describe "users/index" do
  before(:each) do
    @users = create_list(:user, 10)
  end

  it "renders a list of users" do
    visit users_path
  end
end
