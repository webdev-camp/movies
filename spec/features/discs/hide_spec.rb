RSpec.describe "hiding discs" do
  before(:each) do
    sign_user_in
    @disc = create(:disc)
    visit discs_path
  end
  it "the hide disc button shows" do
    expect(page).to have_link("Hide", href: hide_disc_path(@disc))
  end
end
