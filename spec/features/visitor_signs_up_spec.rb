require 'spec_helper'

feature 'Visitor signs up' do
  include UsersHelper

  scenario 'with valid email and password' do
    user = create(:user)
    expect{
      sign_up_with user.name, user.email, user.password
    }.to change{User.count}.by(1)
   expect(page).to have_content(success_signup_message(user))
  end



  def sign_up_with(name, email, password)
    visit signup_path
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Create account'
  end

end