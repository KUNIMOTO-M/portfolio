class ApplicationController < ActionController::Base
	include SessionsHelper
	include RoomsHelper
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller? 
  protect_from_forgery with: :null_session
	private
  
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
	end

end
