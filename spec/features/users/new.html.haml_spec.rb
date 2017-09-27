require 'rails_helper'

RSpec.describe "users/new" do

  it "renders new user form" do
    visit new_user_path
  end
end
