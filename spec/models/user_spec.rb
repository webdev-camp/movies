require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a working factory' do
    expect(build(:user).save).to be true
  end
  it 'checks the user has a name' do
    expect(build(:user, name: "").save).to be false
  end
  it 'checks the user has an email' do
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
end
