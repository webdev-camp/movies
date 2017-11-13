require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a working factory (basic)' do
    expect(build(:card).save).to be true
  end

  it "has a factory with dvds" do
    card_with_dvd = create :card_for_sale
    expect(card_with_dvd.dvd).not_to be nil
  end

  it "shows owned cards" do
    card = create :card_on_shelf
    expect(card.owns.class).to be Date
  end
  it "shows owned cards in user scope" do
    card = create :card_on_shelf
    expect(Card.owned.for_user(card.user).length).to be 1
  end
end
