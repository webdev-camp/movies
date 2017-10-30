require 'rails_helper'

RSpec.describe "roles/index" do
  before(:each) do
    @role = create(:role)
    visit admin_roles_path
  end

  it "renders a list of roles" do
  end
end
