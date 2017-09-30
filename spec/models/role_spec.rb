require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'has a working factory' do
    expect(build(:role).save).to be true
  end

  it "checks movie_id and person_id doesnt save strings" do
    expect(build(:role, movie_id: "a string").save).to be false
  end
end
