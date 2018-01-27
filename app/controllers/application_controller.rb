class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

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
      :website,
      :avatar,
      :avatar_cache,
      :provider,
      :uid
      )
    }
  end
end
