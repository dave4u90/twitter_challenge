require 'rails_helper'

RSpec.describe Identity, type: :model do
  describe ".find_for_oauth" do
    context "when already exist" do
      let(:identity) { create(:identity) }
      
      let!(:auth) do
        OmniAuth::AuthHash.new(uid: identity.uid, extra: { access_token: { params: { screen_name: identity.twitter_screen_name, user_id: identity.twitter_user_id } } })
      end

      it "should not create a new instance" do
        expect(described_class.find_for_oauth(auth)).to eq(identity)
      end
    end

    context "when newly authenticated" do
      let!(:auth) do
        OmniAuth::AuthHash.new(uid: rand(1000000000), extra: { raw_info: { name: Faker::Name.name }, access_token: { params: { screen_name: "bubai4u", user_id: rand(1000000000) } } })
      end

      before { described_class.find_for_oauth(auth) }

      it "should create a new identity record" do
        expect(described_class.count).to eq(1)
      end
    end
  end
end
