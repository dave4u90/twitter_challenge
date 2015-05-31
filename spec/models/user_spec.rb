require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".find_for_oauth" do
    let(:email) { Faker::Internet.email }

    context "when user is already authenticated by twitter" do
      let(:user)     { create(:user, email: email) }
      let(:identity) { create(:identity, user: user) }
      
      let!(:auth) do
        OmniAuth::AuthHash.new(uid: identity.uid, extra: { access_token: { params: { screen_name: identity.twitter_screen_name, user_id: identity.twitter_user_id } } })
      end

      it "should return the user" do
        expect(described_class.find_for_oauth(auth, email)).to eq(user)
      end
    end

    context "when user is not authenticated by twitter yet" do
      let!(:auth) do
        OmniAuth::AuthHash.new(uid: rand(1000000000), extra: { raw_info: { name: Faker::Name.name }, access_token: { params: { screen_name: "bubai4u", user_id: rand(1000000000) } } })
      end

      before { described_class.find_for_oauth(auth, email) }

      it "should create a new user record" do
        expect(described_class.count).to eq(1) 
      end

      it "should associate an identity record for the created user" do
        expect(described_class.first.identity).to be_present
      end
    end
  end
end
