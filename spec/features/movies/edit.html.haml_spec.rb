require 'rails_helper'

RSpec.describe "movies/edit" do
  before(:each) do
    @movie = create(:movie)
    visit edit_movie_path(@movie)
  end

end
