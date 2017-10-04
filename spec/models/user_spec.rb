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

  describe 'reviews' do
    before :each do
      @user = create(:user)
    end
    it 'checks the user has a review' do
      expect(@user.reviews).not_to be nil
    end
    it 'checks the user has a movie' do
      expect(@user.movies).not_to be nil
      expect(@user.movies.length).to be 0
    end
    it 'accesses movies correctly' do
      review = create(:review, user: @user)
      expect(@user.movies.length).to be 1
      expect(@user.movies.first).to eq review.movie
    end
    it 'check a review for a user is in the user review'do
      review = create(:review, user: @user)
      expect(@user.reviews.length).to be 1
      expect(@user.reviews.first).to eq review
    end
  end

  describe 'dvds' do
    before :each do
      @user = create(:user)
    end
    it 'the user has dvds' do
      expect(@user.dvds).not_to be nil
    end
  end
end
