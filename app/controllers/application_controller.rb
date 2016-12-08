class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_404
    render file: "public/404.html", status: 404
  end

  def render_403
    render file: "public/403.html", status: 403
  end  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login, :company_name, :contact_fio, :telephone, :site_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login, :company_name, :company_name, :contact_fio, :telephone, :site_name])
  end

end
