require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:identity) { create(:identity, user: create(:user)) }

  before :each do
    sign_in identity.user
  end

  describe "#show" do
    let!(:tweet)    { double(Twitter::Tweet, created_at: Time.now, text: Faker::Lorem.sentence) }
    let!(:follower) { double(Twitter::User) }
      
    before do
      TwitterClient.stub(:user_timeline).and_return([tweet])
      TwitterClient.stub(:followers).and_return([follower])
    end
    
    context "when html request" do
      before { get :show, id: identity.user.id }
      
      it "should correctly fetch the current user tweets" do
        expect(assigns(:tweets)).to include(tweet)
      end

      it "should correctly fetch the current user followers" do
        expect(assigns(:followers)).to include(follower)
      end
    end

    context "when csv request" do
      before do
        get :show, id: identity.user.id, format: :csv
      end
      
      it "should return csv response for tweets" do
        response.headers['Content-Type'].should eq 'text/csv'
      end
      
      it "should correctly return headers" do
        expect(CSV.parse(response.body).first).to eq(["Tweet Date", "Content"])
      end
    end
  end
  
  describe "#tweets" do
    let(:tweet) { double(Twitter::Tweet) }
    
    before do
      TwitterClient.stub(:user_timeline).and_return([tweet])
      xhr :get, :tweets, screen_name: Faker::Name.first_name
    end
    
    it "should correctly assign user tweets" do
      expect(assigns(:tweets)).to include(tweet)
    end
  end
end
