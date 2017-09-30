require 'rails_helper'

RSpec.describe "reviews/show" do
  before(:each) do
    @review = create(:review)
    visit review_path(@review)
  end

  it "displays the review plot score" do
    expect(page).to have_content("Plot score: #{@review.plot_score}")
  end

  it "displays the review plot comment" do
    expect(page).to have_content("Plot comment: #{@review.plot_comment}")
  end

  it "displays the review acting score" do
    expect(page).to have_content("Acting score: #{@review.acting_score}")
  end

  it "displays the review acting comment" do
    expect(page).to have_content("Acting comment: #{@review.acting_comment}")
  end

  it "displays the review summary" do
    expect(page).to have_content("Summary: #{@review.summary}")
  end

end
