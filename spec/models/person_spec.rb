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
  it 'does not save without a bio' do
    expect(build(:person, bio: "").save).to be false
  end
end
