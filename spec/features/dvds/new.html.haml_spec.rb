require 'rails_helper'

RSpec.describe "dvds/new" do
  before(:each) do
    @user = sign_user_in
    @disc = create(:disc_for_sale, user: @user)
    visit new_disc_dvd_path(@disc)
  end

  it 'will go to the new dvd sale page' do
    expect(page).to have_content('Sell dvd')
  end

  it 'will not save invalid dvd sale data' do
    fill_in(:dvd_price, with: "string")
    fill_in(:dvd_condition, with: "45")
    click_button("Create Dvd")
    expect(page).to have_content("Please review the problems below:")
  end

  it 'goes to the movie page after a dvd sale is created' do
    fill_in(:dvd_price, with: 1)
    fill_in(:dvd_condition, with: "Goood")
    click_button("Create Dvd")
    expect(page).to have_content("DVD sale was successfully created.")
  end
end
