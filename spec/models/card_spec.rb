require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a working factory (basic)' do
    expect(build(:card).save).to be true
  end

  it "has a factory with dvds" do
    card_with_dvd = create :card_on_shelf
    expect(card_with_dvd.dvd).not_to be nil
  end
end
