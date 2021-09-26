class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :name,
        :live_prefecture,
        :favorite_prefecture,
        # :content,
        # :icon,
        # :owner,
        # :admin
        ]
      )
    devise_parameter_sanitizer.permit(
      :account_update, keys: [
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
