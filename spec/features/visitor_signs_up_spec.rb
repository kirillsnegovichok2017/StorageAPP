require 'spec_helper'

feature 'Visitor signs up' do
  include UsersHelper

  scenario 'with valid email and password' do
    user = build(:user)
    expect{
      sign_up_with user
    }.to change{User.count and Folder.count}.by(1)
    expect(page).to have_content(success_signup_message(user))
  end

  scenario 'with user duplication' do
    user = create(:user)
    expect{
      sign_up_with user
    }.not_to change{User.count or Folder.count}
  end



  def sign_up_with(user)
    visit signup_path
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Create account'
  end

end