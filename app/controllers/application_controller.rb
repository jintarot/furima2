class ApplicationController < ActionController::Base
  before_action :configure_parmitted_paramater, if: :devise_controller?
  private
  def configure_parmitted_paramater
    devise_parameter_sanitizer.permit(:sign_up,keys:[:nickname,:birthdate,:first_name,:last_name,:first_name_kana,:last_name_kana])
  end
end
