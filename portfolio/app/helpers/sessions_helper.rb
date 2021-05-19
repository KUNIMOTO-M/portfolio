module SessionsHelper

    #ログインする
    def login(user)
        session[:user_id] = user.id
    end

    #他ページでセッションのうむを確認、取得する
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def current_user?(user)
        user && user == current_user
    end
    

    def login?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)  
    end

    
    
    
end
