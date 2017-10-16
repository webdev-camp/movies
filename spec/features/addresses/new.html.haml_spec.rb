RSpec.describe "address/new" do
  before (:each) do
    @user = sign_user_in
    visit new_address_path(@address)
    @address = create(:address, user: @user)
    @disc = create(:disc_for_sale, user: @user)

  end

  it 'loads new address input page' do
    expect(current_path).to eq new_address_path
  end

  it 'new address page has link to home' do
    expect(page).to have_link("Home", href: discs_path)
  end

end
