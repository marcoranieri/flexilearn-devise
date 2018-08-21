class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Now I can use it in views
  helper_method :current_user

  # Adding Bootstrap Flash types
  add_flash_types :info, :success, :warning, :danger

  # D E V I S E
  # before_action :authenticate_user!
  ## before_action :authenticate_student!, except: :index
  ## before_action :authenticate_tutor!, except: :index

  # P U N D I T
  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :email, :photo, :password, :pro, :password_confirmation, :remember_me])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :pro, :email, :photo, :password, :password_confirmation, :remember_me])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def current_user
    if current_student   # You could use student_signed_in? instead.
      current_student
    elsif current_tutor
      current_tutor
    else
      Student.new # Not-LoggedIn User (Pundit)
    end
  end

end
