require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'has a working factory' do
    expect(build(:role).save).to be true
  end

  it "movie_id and person_id doesnt save strings" do
    expect(build(:role, movie_id: "a string").save).to be false
  end

  it 'person is assigned to role' do
    role = create(:role)
    expect(role.person.bio).to eq('A bio')
  end

  it "person name isn't nil" do
    role = create(:role)
    expect(role.person.name).not_to be nil
  end

  it "movie is there" do
    role = create(:role)
    expect(role.movie.title).not_to be nil
  end
end
