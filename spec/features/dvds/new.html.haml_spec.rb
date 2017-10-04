require 'rails_helper'

RSpec.describe "reviews/new" do
  before(:each) do
    @user = create(:user)
    sign_user_in
    @movie = create(:movie)
    visit new_movie_dvds_path(@movie)
    @dvd = create(:dvd, movie: @movie, user: @user)
  end

  it "renders new dvd form" do

  end

  it 'will not save invalid data' do
    fill_in(:dvd_price, with: @dvd.price)
    fill_in(:dvd_condition, with: @dvd.condition)
    click_button("Create Dvd")
    expect(page).to have_content("Please review the problems below:")
  end

  it 'goes to the movies page after a review is created' do
    fill_in(:dvd_price, with: 1)
    fill_in(:dvd_condition, with: "Goood")
    click_button("Create Dvd")
    expect(page).to have_content("Review was successfully created.")
  end
end
