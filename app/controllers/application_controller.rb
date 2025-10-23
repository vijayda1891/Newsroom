class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  def newsroom
    render 'shared/newsroom_view'
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      dashboard_home_path 
    else
      super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :surname, :gender, :date_of_birth ])
  end
end
