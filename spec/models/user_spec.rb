require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a working factory' do
    expect(build(:user).save).to be true
  end

  it 'checks the user has valid a name' do
    expect(build(:user, name: "").save).to be false
  end

  it 'checks the user has a valid email' do
    expect(build(:user, email: "").save).to be false
  end

  it "check two users don't have the same email" do
    user = create :user
    phoney = build :user, email: user.email
    expect(phoney.save).to be false
  end
  
  it 'the factory creates two users' do
    user = create :user
    phoney = create :user
    expect(user.email).not_to eq(phoney.email)
  end

  describe 'cards' do
    it 'the user has card association' do
      user = create(:user)
      expect(user.cards).not_to be nil
    end

    it 'the user has dvds' do
      user = create(:user)
      card = create(:card, user: user)
      expect(user.cards.first).to eq card
    end

    it 'creates a user with 5 cards' do
      user = create(:user_with_5_cards)
      expect(user.cards.length).to be 5
    end
  end
end
