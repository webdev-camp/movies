RSpec.describe "purchases/create" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_for_sale, user: @user)
    visit sale_list_movie_path(@card)
  end

  it "can create purchase from sale list page" do
    expect(page).to have_button("Create Purchase")
  end

  it "goes to purchase path on click" do
    click_button("Create Purchase")
    expect(current_path).to eq new_address_path
  end

  it "creates a purchase on click" do
    click_button("Create Purchase")
    purchase = Purchase.where(buyer: @user, dvd_id: @card.dvd_id)
    expect(purchase.length).to eq 1
  end
end
