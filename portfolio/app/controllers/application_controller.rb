class ApplicationController < ActionController::Base
	include RoomsHelper
	before_action :authenticate_user!, except: [:home, :about, :help]
	before_action :configure_permitted_parameters, if: :devise_controller? 
  protect_from_forgery with: :null_session
	private
  
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
	end

end
