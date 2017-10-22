RSpec.describe Relationship, type: :model do
  before(:each) do
    @users = create_list(:user, 2)
    @first_user = @users.first
    @second_user = @users.last
  end
  it 'lets a user follow another user' do
    @first_user.active_relationships.create(followed_id: @second_user.id)
    expect(@first_user.active_relationships.first.followed_id).to be @second_user.id
  end

  it 'should be valid' do
    relationship = Relationship.new(follower_id: @first_user.id,
                                    followed_id: @second_user.id)
    expect(relationship.valid?).to be true
  end

  it 'should require a follower id' do
    @first_user.id = nil
    relationship = Relationship.new(follower_id: @first_user.id,
                                    followed_id: @second_user.id)
    expect(relationship.valid?).to be false
  end

  it 'should require a followed id' do
    @second_user.id = nil
    relationship = Relationship.new(follower_id: @first_user.id,
                                    followed_id: @second_user.id)
    expect(relationship.valid?).to be false
  end
end
