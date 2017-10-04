require 'rails_helper'

RSpec.describe Dvd, type: :model do
  before(:each) do
    @dvd = build(:dvd)
  end

  it 'has a working factory' do
    expect(build(:dvd).save).to be true
  end
end
