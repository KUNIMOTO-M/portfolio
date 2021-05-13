class SessionsController < ApplicationController
	#アプリケーションコントローラーで定義
	before_action :logged_in_user, only: [:destroy]

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
		log_out if login?
		flash[:notice] = "ログアウトしました"
    redirect_to root_path    
	end	 
end
