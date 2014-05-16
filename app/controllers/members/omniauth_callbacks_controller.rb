# See https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview

class Members::OmniauthCallbacksControllerController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @member = Member.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @member.persisted?
      sign_in_and_redirect @member, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_url
    end
  end

  def twitter

  end

  def google

  end
end
