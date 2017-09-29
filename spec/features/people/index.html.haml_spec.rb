require 'rails_helper'

RSpec.describe "people/index" do
  before(:each) do
    @people = create_list(:person, 10)
  end

  it "renders a list of people" do
    visit admin_people_path
  end
end
