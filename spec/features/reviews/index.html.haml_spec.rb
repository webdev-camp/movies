require 'rails_helper'

RSpec.describe "reviews/index" do
  before(:each) do
    @review = create(:review)
    visit reviews_path
  end

  it "renders a list of reviews" do
  end

  it 'has a new review link' do
    expect(page).to have_link('New Review', href: new_review_path)
  end

  it 'has an edit link' do
    expect(page).to have_link('Edit', href: edit_review_path(@review))
  end

  it 'has a show link' do
    expect(page).to have_link('Show', href: review_path(@review))
  end

  it 'has a destroy link' do
    expect(page).to have_link('Destroy', href: review_path(@review))
  end

end
