require 'rails_helper'

RSpec.describe "dvds/new" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_for_sale, user: @user)
    visit new_card_dvd_path(@card)
  end

  it 'will go to the new dvd sale page' do
    expect(page).to have_content('Sell your DVD')
  end

  it 'will not save invalid dvd sale data' do
    fill_in(:dvd_price, with: "Awesome")
    select("Fair", from: :dvd_condition)
    click_button("Save")
    expect(page).to have_content("Please review the problems below:")
  end

  it 'goes to the movie page after a dvd sale is created' do
    fill_in(:dvd_price, with: "5")
    select("Fair", from: :dvd_condition)
    click_button("Save")
    expect(page).to have_content("DVD sale was successfully created.")
  end
end
