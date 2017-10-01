require 'rails_helper'

RSpec.describe "reviews/edit" do
  before(:each) do
    @review = create(:review)
    visit edit_review_path(@review)
    fill_in(:review_plot_score, with: @review.plot_score)
    fill_in(:review_plot_comment, with: @review.plot_comment)
    fill_in(:review_acting_score, with: @review.acting_score)
    fill_in(:review_acting_comment, with: @review.acting_comment)
    fill_in(:review_summary, with: @review.summary)
  end

  it "submits an edited review" do
    click_button('Update Review')
    expect(page).to have_content('Review was successfully updated.')
  end

  it 'will not update with invalid data' do
    fill_in(:review_plot_score, with: -23)
    click_button('Update Review')
    expect(page).to have_content('Please review the problems below:')
  end
end
