require 'rails_helper'

RSpec.describe "people/show" do
  before(:each) do
    @person = create(:person)
  end

  it "renders person show page" do
    visit person_path(@person)
  end
end
