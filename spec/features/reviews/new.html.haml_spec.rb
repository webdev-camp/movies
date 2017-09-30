require 'rails_helper'

RSpec.describe "reviews/new" do
  before(:each) do
    visit new_review_path
    @review = create(:review)
    fill_in(:review_plot_score, with: @review.plot_score)
    fill_in(:review_plot_comment, with: @review.plot_comment)
    fill_in(:review_acting_score, with: @review.acting_score)
    fill_in(:review_acting_comment, with: @review.acting_comment)
    fill_in(:review_summary, with: @review.summary)
  end

  it "renders new review form" do
  end

  it 'goes to the show page after a review is created' do
    click_button('Create Review')
    expect(page).to have_content('Review was successfully created.')
  end

  it 'will not update with invalid data' do
    fill_in(:review_plot_score, with: -23)
    click_button('Create Review')
    expect(page).to have_content('Please review the problems below:')
  end
end
