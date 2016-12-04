class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :rut
    devise_parameter_sanitizer.for(:sign_in) << :rut
  end
end
