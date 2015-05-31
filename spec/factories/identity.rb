FactoryGirl.define do
  factory :identity do
    twitter_screen_name "bubai4u"
    twitter_user_id { rand(1000000000) }
    uid { rand(1000000000) }
  end
end
