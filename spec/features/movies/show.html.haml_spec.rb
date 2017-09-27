require 'rails_helper'

RSpec.describe "movies/show" do
  before(:each) do
    @movie = create(:movie)
    visit movie_path(@movie)
  end

end
