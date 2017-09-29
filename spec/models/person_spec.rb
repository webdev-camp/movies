require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'has a working factory' do
    expect(build(:person).save).to be true
  end
end
