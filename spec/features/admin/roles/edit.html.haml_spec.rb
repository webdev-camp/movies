require 'rails_helper'

RSpec.describe "roles/edit" do
  before(:each) do
    @role = create(:role)
    edit_admin_role_path(@role)
  end

  it "renders the edit role form" do
  end
end
