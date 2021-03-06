class CallbacksController < Devise::OmniauthCallbacksController
# Manage the response (callback) from Facebook Auth

  def facebook
    @user = Student.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      redirect_to new_student_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
