# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do

  scenario 'user signs out successfully(on the footer)' do
    sign_new
    click_link 'Log out'
    expect(page.current_path).to eq new_user_session_path
#FIXME    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end

end
