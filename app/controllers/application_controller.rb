class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin!
   redirect_to new_user_session_path unless current_user.admin
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(
      :password,
      :password_confirmation,
      :current_password,
      :email,
      :name,
      :country,
      :bio,
      :title,
      :phone_number,
      :website,
      :avatar,
      :avatar_cache,
      :provider,
      :uid
      )
    }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
      :password,
      :password_confirmation,
      :current_password,
      :email,
      :name,
      :country,
      :bio,
      :title,
      :phone_number,
      :website,
      :avatar,
      :avatar_cache,
      :provider,
      :uid
      )
    }
  end
end
