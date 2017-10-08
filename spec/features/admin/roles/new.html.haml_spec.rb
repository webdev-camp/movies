require 'rails_helper'

RSpec.describe "roles/new" do
  before(:each) do
    @role = create(:role)
    visit new_admin_role_path
  end

  it "renders new role form" do
  end
end
