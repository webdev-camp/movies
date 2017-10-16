require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'has a working factory' do
    expect(build(:address).save).to be true
  end

  it 'does not save without a street name' do
    expect(build(:address, street: "").save).to be false
  end

  it 'has a valid postcode' do
    expect(build(:address, postcode: "").save).to be false
  end

  it 'does not save without a city name' do
    expect(build(:address, city: "").save).to be false
  end

  it 'does not save without the country name' do
    expect(build(:address, country: "").save).to be false
  end
end
