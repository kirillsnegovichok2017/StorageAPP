require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "should redirects to user newly created page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
