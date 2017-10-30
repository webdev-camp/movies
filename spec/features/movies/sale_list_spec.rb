require 'rails_helper'

RSpec.describe "#sale_list" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_for_sale, user: @user)
    visit sale_list_movie_path(@card.movie)
  end

  it 'shows title of movie dvd on sale' do
    expect(page).to have_content(@card.movie.title)
  end

end
