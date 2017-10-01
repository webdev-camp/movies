require 'rails_helper'
RSpec.describe Review, type: :model do
  before(:each) do
    @review = build(:review)
  end

  it 'has a working factory' do
    expect(build(:review).save).to be true
  end

  it 'checks the review has a valid plot score' do
    expect(build(:review, plot_score: 10000).save).to be false
  end

  it 'checks the review has a valid plot comment' do
    expect(build(:review, plot_comment: 'hi').save).to be false
  end

  it 'checks the review has valid an acting score' do
    expect(build(:review, acting_score: 'hello').save).to be false
  end

  it 'checks the review has a valid acting comment' do
    expect(build(:review, plot_comment: 'hi').save).to be false
  end

  it 'checks the review has a valid summary' do
    expect(build(:review, summary: 'hello'*500).save).to be false
  end


end
