class ApplicationController < ActionController::Base
  before_action :configure_parmitted_paramater, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_parmitted_paramater
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[nickname birthdata first_name last_name first_name_kana last_name_kana])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2050'
    end
  end
end
