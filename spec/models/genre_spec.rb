require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'has a working factory' do
    expect(build(:genre).save).to be true
  end

  it 'the genre has a value' do
    expect(build(:genre, name: "").save).to be false
  end
end
