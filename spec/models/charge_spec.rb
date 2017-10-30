require 'rails_helper'
RSpec.describe Charge, type: :model do
  before(:each) do
    @charge = build(:charge)
  end

  it 'has a working factory' do
    expect(build(:charge).save).to be true
  end

end
