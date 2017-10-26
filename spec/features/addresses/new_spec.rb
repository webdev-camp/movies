RSpec.describe "address/new" do
  before (:each) do
    @user = sign_user_in
    visit new_address_path
    @address = build(:address, user: @user)
  end

  it 'loads new address input page' do
    expect(current_path).to eq new_address_path
  end

  it 'new address page has link to home' do
    expect(page).to have_link("Home", href: cards_path)
  end

  xit 'goes to new charge page when address is created' do
    fill_in(:address_street, with: @address.street)
    fill_in(:address_postcode, with: @address.postcode)
    fill_in(:address_city, with: @address.city)
    fill_in(:address_country, with: @address.country)
    click_button("Create Address")
    expect(current_path).to eq new_charge_path, wait: 10
  end
end

describe "Address/new with existing" do
  xit "redirects to new charges if address exists" do
    @user = sign_user_in
    @address = create(:address, user: @user)
    visit new_address_path
    expect(current_path).to eq new_charge_path
  end
end
