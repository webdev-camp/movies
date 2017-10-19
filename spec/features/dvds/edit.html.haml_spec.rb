require 'rails_helper'

RSpec.describe "dvds/edit" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_for_sale, user: @user)
    visit edit_card_dvd_path(@card)
  end

  it 'will go to the edit dvd sale page' do
    expect(page).to have_content('Edit dvd')
  end

  it 'will display previous dvd sale price and condition' do
    expect(find_field('dvd_price').value).to have_content(10)
    expect(find_field('dvd_condition').value).to have_content('good')
  end

  it "dvd sale information can be edited successfully" do
    fill_in(:dvd_price, with: "12")
    fill_in(:dvd_condition, with: "good")
    click_button('Update Dvd')
    expect(page).to have_content('DVD sale was successfully updated.')
  end

  it "will not save invalid edit dvd sale data" do
    fill_in(:dvd_price, with: '')
    fill_in(:dvd_condition, with: '')
    click_button('Update Dvd')
    expect(page).to have_content('Please review the problems below')
  end
end
