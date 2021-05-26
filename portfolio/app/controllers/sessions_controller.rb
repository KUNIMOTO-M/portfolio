class SessionsController < ApplicationController
	#アプリケーションコントローラーで定義

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
			if user && user.authenticate(params[:session][:password])
				login(user)
				redirect_to root_url
			else
				flash.now[:danger] = '無効なメールアドレスまたはパスワードです'
				render 'new'
			end
			
	end
        
	def	destroy
		log_out if user_signed_in?
		flash[:notice] = "ログアウトしました"
    redirect_to root_path    
	end	 
end
