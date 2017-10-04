RSpec.describe "dvds/new" do
  before(:each) do
    @user = sign_user_in
    @movie = create(:movie)
    @dvd = build(:dvd, movie: @movie, user: @user)
    visit new_movie_dvd_path(@movie)
  end

  it "renders new dvd form" do

  end
end
#
#   it 'will not save invalid data' do
#     fill_in(:dvd_price, with: @dvd.price)
#     fill_in(:dvd_condition, with: @dvd.condition)
#     click_button("Create Dvd")
#     expect(page).to have_content("Please review the problems below:")
#   end
#
#   it 'goes to the movies page after a dvd is created' do
#     fill_in(:dvd_price, with: 1)
#     fill_in(:dvd_condition, with: "Goood")
#     click_button("Create Dvd")
#     expect(page).to have_content("Review was successfully created.")
#   end
# end
