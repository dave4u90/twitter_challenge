require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :controller do
  let(:email)    { Faker::Internet.email }
  let(:identity) { create(:identity) }
      
  let!(:auth) do
    OmniAuth::AuthHash.new(uid: identity.uid, extra: { raw_info: { name: Faker::Name.name }, access_token: { params: { screen_name: identity.twitter_screen_name, user_id: identity.twitter_user_id } } })
  end

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = auth
  end
  
  describe "#twitter" do
    before { get :twitter, user: { email: email } }

    it "should assign the user correctly" do
      expect(assigns(:user).email).to eq(email)
    end

    it "should redirect to user profile" do
      expect(response).to redirect_to(assigns(:user))
    end
  end
end
