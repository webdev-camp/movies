feature 'User profile page' do


  scenario 'user sees own profile' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path
    expect(page).to have_content 'Password confirmation'
    expect(find_field('user_email').value).to eq user.email
    #expect(find_field('user_name').value).to eq user.street
  end

end
