class Identity < ActiveRecord::Base
  belongs_to :user
  
  validates :uid, :twitter_screen_name, :twitter_user_id, presence: true, uniqueness: true
  
  def self.find_for_oauth(auth)
    where(uid: auth.uid, 
          twitter_screen_name: auth.extra.access_token.params[:screen_name], 
          twitter_user_id: auth.extra.access_token.params[:user_id]).first_or_create
  end
end
