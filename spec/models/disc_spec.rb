require 'rails_helper'

RSpec.describe Disc, type: :model do
  it 'has a working factory (basic)' do
    expect(build(:disc).save).to be true
  end

  it "has a factory with dvds" do
    disc_with_dvd = create :disc_on_shelf
    expect(disc_with_dvd.dvd).not_to be nil
  end
end
