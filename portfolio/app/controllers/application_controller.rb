class ApplicationController < ActionController::Base
	include SessionsHelper
	include RoomsHelper
        
	private
    
	def logged_in_user
    unless login?
  		flash[:danger] = "ログインしてください"
    	redirect_to login_path
    end     
  end    
    
end
