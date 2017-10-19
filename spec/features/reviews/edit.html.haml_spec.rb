require 'rails_helper'

RSpec.describe "reviews/edit" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_with_review, user: @user)
    visit edit_card_review_path(@card)
  end
  it 'will go to the edit review page' do
    expect(page).to have_content('Edit review')
  end
  it 'will display previous review information' do
    expect(find_field('review_plot_comment').value).to have_content('MyString')
  end
  it 'will update a review' do
    fill_in(:review_plot_comment, with: 'MyNewString')
    click_button('Update Review')
    expect(page).to have_content('Review was successfully updated.')
    expect(@card.reload.review.plot_comment).to eq 'MyNewString'
  end
end
