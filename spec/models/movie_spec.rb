require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'has a working factory' do
    expect(build(:movie).save).to be true
  end
  it 'the movie has a title' do
    expect(build(:movie, title: "").save).to be false
  end
  it 'the movie has a summary' do
    expect(build(:movie, summary: "").save).to be false
  end
  it 'generates imdb link' do
    movie = create :movie
    expect(movie.imdb_link).to start_with "http"
  end

  describe "roles" do
    before :each do
      @movie = create :movie
    end
    it 'movie has roles' do
      expect(@movie.roles).not_to be nil
      expect(@movie.roles.length).to be 0
    end

    it 'movie has people' do
      expect(@movie.people).not_to be nil
      expect(@movie.people.length).to be 0
    end

    it 'accesses people correctly'do
      role = create(:role, movie: @movie)
      expect(@movie.people.length).to be 1
      expect(@movie.people.first).to eq role.person
    end

    it 'a role for a movie is in the movie roles'do
      role = create(:role, movie: @movie)
      expect(@movie.roles.length).to be 1
      expect(@movie.roles.first).to eq role
    end
  end
end
