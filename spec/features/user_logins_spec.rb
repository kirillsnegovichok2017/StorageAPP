require 'rails_helper'

RSpec.describe "UserLogins", type: :request do

  include SessionsHelper

  feature "GET /user_logins" do
    scenario "login with invalid info" do
      visit login_path
      fill_in 'session_email', with: 'asd'
      fill_in 'session_password', with: 'pas'
      click_button 'Log in'
      expect(page).to have_content login_err_msg
    end
  end
end
