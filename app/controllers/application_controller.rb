class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # before_action :login_required
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # def login_required
  #   redirect_to new_session_path unless current_user
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :name,
        :live_prefecture,
        :favorite_prefecture,
        :content,
        :icon,
        :owner,
        :admin
        ]
      )
  end
end
