require 'rails_helper'

RSpec.describe Dvd, type: :model do
  it 'has a working factory' do
    expect(build(:dvd).save).to be true
  end
  it 'has a working factory for dvd for sale' do
    expect(build(:dvd_for_sale).save).to be true
  end
  it 'will not save a dvd without a condition if it has a price' do
    expect(build(:dvd_for_sale, condition: '').save).to be false
  end
  it 'will not save a dvd without a price if it has a condition' do
    expect(build(:dvd_for_sale, price: '').save).to be false
  end
end
