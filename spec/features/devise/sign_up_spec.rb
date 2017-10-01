feature 'Sign Up', :devise do

  scenario 'after good sign up redirect to root' do
    sign_up_with()
    expect(page.current_path).to eq root_path
  end

  

  scenario 'visitor cannot sign up with invalid email address' do
    sign_up_with( email: 'bogus')
    expect(page).to have_content 'is invalid'
  end

  scenario 'visitor cannot sign up without password' do
    sign_up_with(password: '')
    expect(page).to have_content "can't be blank"
  end

  scenario 'visitor cannot sign up with a short password' do
    sign_up_with(password: "123" )
    expect(page).to have_content "is too short"
  end

  scenario 'visitor cannot sign up without password confirmation' do
    sign_up_with(confirmation: '')
    expect(page).to have_content "doesn't match Password"
  end

  scenario 'visitor cannot sign up with mismatched password and confirmation' do
    sign_up_with(password: 'please123', confirmation: 'mismatch')
    expect(page).to have_content "doesn't match Password"
  end

end
