class UsersController < ApplicationController
  require 'csv'

  before_action :set_user, only: [:show]

  def show
    @tweets = TwitterClient.user_timeline(current_user.identity.twitter_screen_name).take(10)
    @followers = TwitterClient.followers(current_user.identity.twitter_screen_name).take(10)
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
      
      format.csv do
        send_data tweets_csv(@tweets), filename: "#{current_user.identity.twitter_screen_name}_tweets.csv"
      end
    end
  end

  def tweets
    @tweets = TwitterClient.user_timeline(params[:screen_name]).take(10)

    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    accessible = [ :name, :email ] 
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

  def tweets_csv(tweets)
    headers = ["Tweet Date", "Content"]
    
    CSV.generate do |csv|
      csv << headers

      tweets.each { |tweet| csv << [tweet.created_at, tweet.text] }
    end
  end
end

