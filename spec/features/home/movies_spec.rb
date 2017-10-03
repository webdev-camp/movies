RSpec.describe "user/home" do
  it "no access if not logged in" do
    visit home_movie_path
    expect(current_path).to eq(new_user_session_path)
  end

  it "can access if logged in" do
    sign_user_in
    visit home_movie_path
    expect(current_path).to eq(home_movie_path)
  end

end
