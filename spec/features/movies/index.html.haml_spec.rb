require 'rails_helper'

RSpec.describe "movies/index" do
  before(:each) do
    @movies = create_list(:movie, 20)
    visit movies_path
  end

end
