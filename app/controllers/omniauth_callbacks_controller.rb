class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_oauth(request.env["omniauth.auth"], params[:user][:email])
    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: "Twitter")
  end
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end
