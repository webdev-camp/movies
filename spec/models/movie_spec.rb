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
end 
