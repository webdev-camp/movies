require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a working factory' do
    expect(build(:movie).save).to be true
  end
  it 'checks the movie has a title' do
    expect(build(:movie, title: "").save).to be false
  end
  it 'checks the movie has a summary' do
    expect(build(:movie, summary: "").save).to be false
  end

  describe "roles" do
    before :each do
      @movie = create :movie
    end
    it 'checks movie has roles' do
      expect(@movie.roles).not_to be nil
      expect(@movie.roles.length).to be 0
    end
    
    it 'check a role for a movie is in the movie roles'do
      role = create(:role, movie: @movie)
      expect(@movie.roles.length).to be 1
      expect(@movie.roles.first).to eq role
    end

  end

end
