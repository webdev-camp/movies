require 'rails_helper'

RSpec.describe "people/edit" do
  before(:each) do
    sign_admin_in
    @person = create(:person)
    visit edit_admin_person_path(@person)
  end

  it "test person can update information" do
    fill_in('person_name', with: 'edited user')
    fill_in('person_bio', with: 'Some text here longer than 10 characters')
    click_button('Update Person')
    expect(page).to have_content('Person was successfully updated.')
  end

  it "will not save an empty name and bio update for person" do
    fill_in('person_name', with: '')
    fill_in('person_bio', with: '')
    click_button('Update Person')
    expect(page).to have_content('Please review the problems below')
  end
end
