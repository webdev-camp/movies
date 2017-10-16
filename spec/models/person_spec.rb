require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'has a working factory' do
    expect(build(:person).save).to be true
  end
  it 'does not assign an invalid tmdb_id' do
    expect(build(:person, tmdb_id: -56).save).to be false
  end
  it 'does not save without a name' do
    expect(build(:person, name: "").save).to be false
  end
  it 'can save without a bio' do
    expect(build(:person, bio: "").save).to be true
  end

  describe "roles" do
    before :each do
      @person = create :person
    end
    it 'checks person has roles' do
      expect(@person.roles).not_to be nil
      expect(@person.roles.length).to be 0
    end
    it 'checks person has movies' do
      expect(@person.movies).not_to be nil
      expect(@person.movies.length).to be 0
    end
    it 'accesses movies correctly'do
      role = create(:role, person: @person)
      expect(@person.movies.length).to be 1
      expect(@person.movies.first).to eq role.movie
    end
    it 'check a role for a person is in the person roles'do
      role = create(:role, person: @person)
      expect(@person.roles.length).to be 1
      expect(@person.roles.first).to eq role
    end
  end
end
