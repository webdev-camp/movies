RSpec.describe "address" do
  before (:each) do
    @user = sign_user_in
    @address = create(:address, user: @user)
    visit address_path(@user)
  end

  it 'displays address show page' do
    expect(current_path).to eq address_path(@user)
  end
end
