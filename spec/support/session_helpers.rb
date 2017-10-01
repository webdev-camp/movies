module SessionHelpers
  def sign_up_with(options = {})
    user = options[:user] || build(:user)
    visit new_user_registration_path
    within ".authform" do
      fill_in 'Name', with: options[:name] || user.name
      fill_in 'Email', with: options[:email] || user.email
      #fill_in 'Country',with: options[:country] || user.country
      fill_in 'Password', with: options[:password] || user.password ,
                :match => :prefer_exact
      fill_in 'Password confirmation',
          :with => options[:confirmation] || options[:confirmation] || user.password,
          :match => :prefer_exact
    end
    click_button 'Sign up'
  end

  def signin(email, password , scope = ".authform")
    visit new_user_session_path
    within scope do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end
  end

  def sign_new
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    user
  end
end

RSpec.configure do |config|
  config.include SessionHelpers
end
