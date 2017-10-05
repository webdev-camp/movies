require 'rails_helper'

RSpec.describe "reviews/new" do
  before(:each) do
    @user = sign_user_in
    @disc = create(:disc, user: @user)
    visit new_disc_review_path(@disc)
    @review = build(:review, movie: @movie, user: @user)
  end

  it "renders new review form" do
    expect(current_path).to eq new_disc_review_path(@disc)
  end

  it 'will not save invalid data' do
    fill_in(:review_plot_score, with: '')
    fill_in(:review_plot_comment, with: '')
    fill_in(:review_acting_score, with: '')
    fill_in(:review_acting_comment, with: '')
    fill_in(:review_summary, with: '')
    click_button('Create Review')
    expect(page).to have_content('Please review the problems below:')
  end

  xit 'goes to the movies page after a review is created' do
    fill_in(:review_plot_score, with: @review.plot_score)
    fill_in(:review_plot_comment, with: @review.plot_comment)
    fill_in(:review_acting_score, with: @review.acting_score)
    fill_in(:review_acting_comment, with: @review.acting_comment)
    fill_in(:review_summary, with: @review.summary)
    click_button('Create Review')
    expect(current_path).to eq disc_path(@disc)
    expect(page).to have_content('plot')
    expect(page).to have_content('acting')
  end

end

describe "reviews/new" do
  before(:each) do
    @user = sign_user_in
    @disc = create(:disc, user: @user)
    @review = create(:review, movie: @disc.movie, user: @user)
    visit new_disc_review_path(@disc)
  end

  it 'does not create two new reviews' do
    expect(current_path).to eq edit_disc_review_path(@disc)
  end
end
