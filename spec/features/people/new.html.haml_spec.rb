require 'rails_helper'

RSpec.describe "people/new" do

  it "renders new person form" do
    visit new_admin_person_path
  end
end
