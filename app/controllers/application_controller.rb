class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone_number, :role])
  end

  def after_sign_in_path_for(current_user)
    if current_user.role == 'seller'
      return show_path
    else
      root_path
    end
  end
end
