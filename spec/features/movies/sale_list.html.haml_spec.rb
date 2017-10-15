require 'rails_helper'

RSpec.describe "#sale_list" do
  before(:each) do
    @user = sign_user_in
    @disc = create(:disc_for_sale, user: @user)
    visit sale_list_movie_path(@disc.movie)
  end

  it 'shows title of movie dvd on sale' do
    expect(page).to have_content(@disc.movie.title)
  end

  it "the page with one dvd for sale works" do
    expect(page).to have_link("Buy", href: disc_dvd_path(@disc.dvd))
  end

end
