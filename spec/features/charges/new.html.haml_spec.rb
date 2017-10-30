RSpec.describe "charges/new" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_for_sale)
    visit sale_list_movie_path(@card.movie)
    @address = create(:address, user: @user)
    @purchase = create(:purchase, buyer: @user, dvd: @card.dvd)
    visit new_charge_path
  end

  # VCR.use_cassette('Stripe payment') do
  #   it 'fills in card details', js: true do
  #     stripe_frame = all('iframe')
  #     within_frame(stripe_frame[0]) do
  #       fill_in(:cardnumber, with: 4242424242424242)
  #     end
  #     within_frame(stripe_frame[1]) do
  #       fill_in(:cvc, with: 222)
  #     end
  #     within_frame(stripe_frame[2]) do
  #       fill_in(:'exp-date', with: 1120)
  #     end
  #     click_button("Submit Payment")
  #     expect(page).to have_content("thanks")
  #   end
  # end
end
