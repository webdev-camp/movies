require 'rails_helper'

RSpec.describe "movies/new" do

  it "renders new movie form" do
    visit new_movie_path
  end
end
