require 'rails_helper'

RSpec.describe "movies/show" do
  before(:each) do
    @movie = create(:movie)
    visit movie_path(@movie)
  end

  it "shows a movie" do
    expect(current_path).to eq(movie_path(@movie))
  end
end
