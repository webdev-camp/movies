RSpec.describe "home/index" do

  it "shows the landing page" do
    visit root_path
    expect(page).to have_content("Home")
  end
end
