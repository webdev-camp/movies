require 'rails_helper'

RSpec.describe "reviews/new" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card, user: @user)
    visit new_card_review_path(@card)
    @review = build(:review, card: @card)
  end

  it "renders new review form" do
    expect(current_path).to eq new_card_review_path(@card)
  end

  it 'will not save invalid data' do
    plot_score = page.find_by_id('review_plot_score', visible: false)
    acting_score = page.find_by_id('review_acting_score', visible: false)
    plot_score.set ''
    fill_in(:review_plot_comment, with: '')
    acting_score.set ''
    fill_in(:review_acting_comment, with: '')
    click_button('Create Review')
    expect(page).to have_content('Please review the problems below:')
  end

  it 'goes to the movies page after a review is created' do
    plot_score = page.find_by_id('review_plot_score', visible: false)
    acting_score = page.find_by_id('review_acting_score', visible: false)
    plot_score.set @review.plot_score
    fill_in(:review_plot_comment, with: @review.plot_comment)
    acting_score.set @review.acting_score
    fill_in(:review_acting_comment, with: @review.acting_comment)
    click_button('Create Review')
    expect(current_path).to eq movie_path(@card.movie)
    expect(page).to have_link(nil , href: edit_card_review_path(@card))
  end

end

describe "reviews/new" do
  before(:each) do
    @user = sign_user_in
    @card = create(:card_with_review, user: @user)
    visit new_card_review_path(@card)
  end

  it 'does not create two new reviews' do
    expect(current_path).to eq edit_card_review_path(@card)
  end
end
