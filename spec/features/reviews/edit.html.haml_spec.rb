require 'rails_helper'

RSpec.describe "reviews/edit" do
  before(:each) do
    @user = sign_user_in
    @disc = create(:disc_with_review, user: @user)
    visit edit_disc_review_path(@disc)
  end
  it 'will go to the edit review page' do
    expect(page).to have_content('Edit review')
  end
  it 'will display previous review information' do
    expect(find_field('review_plot_score').value).to have_content(50)
    expect(find_field('review_plot_comment').value).to have_content('MyString')
  end
  it 'will update a review' do
    fill_in(:review_plot_score, with: 25)
    click_button('Update Review')
    expect(page).to have_content('Review was successfully updated.')
    expect(@disc.reload.review.plot_score).to eq 25
  end
end
