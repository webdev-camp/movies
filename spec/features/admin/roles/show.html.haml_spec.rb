require 'rails_helper'

RSpec.describe "roles/show" do
  before(:each) do
    @role = create(:role)
    visit admin_role_path(@role)
  end

  it "renders roles show page" do
  end
end
