class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:user_image, :dob, :interests, :location, :bio, :position, :team_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:user_image, :dob, :interests, :location, :bio, :position])
  end
  
  protect_from_forgery with: :exception

  private

    def after_sign_in_path_for(resource)
       "/home"
    end
    
end
