class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV.fetch('USER'), password: ENV.fetch('PASSWORD') if Rails.env.production?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile blog_url])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile blog_url])
  end
end
