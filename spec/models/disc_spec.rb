require 'rails_helper'

RSpec.describe Disc, type: :model do
  it 'has a working factory' do
    expect(build(:disc).save).to be true
  end
end
