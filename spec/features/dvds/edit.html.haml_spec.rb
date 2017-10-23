require 'rails_helper'

RSpec.describe "dvds/edit" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_for_sale, user: @user)
    visit edit_card_dvd_path(@card)
  end

  it 'will go to the edit dvd sale page' do
    expect(page).to have_content('Change the details of your DVD for sale:')
  end

  it 'will display previous dvd sale price and condition' do
    expect(find_field('dvd_price').value).to have_content(10)
    expect(find_field('dvd_condition').value).to have_content('Fair')
  end

  it "dvd sale information can be edited successfully" do
    fill_in(:dvd_price, with: "5")
    select("Fair", from: :dvd_condition)
    click_button('Save the changes')
    expect(page).to have_content('DVD sale was successfully updated.')
  end

  it "will not save invalid edit dvd sale data" do
    fill_in(:dvd_price, with: "")
    select("Fair", from: :dvd_condition)
    click_button('Save the changes')
    expect(page).to have_content('Please review the problems below')
  end
end
