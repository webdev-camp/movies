RSpec.describe "address" do
  before (:each) do
    @user = sign_user_in
    @address = create(:address)
    visit new_address_path
  end

  it 'renders new address page' do
    expect(current_path).to eq new_address_path
  end

  it 'display buyer address country' do
    expect(page).to have_content(:address)
  end
end
