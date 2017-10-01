feature 'Sign in', :devise do

  scenario 'user cannot sign in if not registered' do
    signin('test@example.com', 'please123' , ".authform")
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'Email'
  end

  scenario 'user can sign in with valid credentials' do
    user = create(:user)
    signin(user.email, user.password , ".authform")
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'user cannot sign in with wrong email' do
    user = create(:user)
    signin('invalid@email.com', user.password , ".authform")
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'Email'
  end

  scenario 'user cannot sign in with wrong password' do
    user = create(:user)
    signin(user.email, 'invalidpass' , ".authform")
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'Email'
  end

end
