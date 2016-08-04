require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end


    describe "POST #create" do
      it "when password is invalid" do
        user = create(:user)

        #post :create,

      end
    end
  end

end
