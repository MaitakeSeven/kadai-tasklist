module SessionsHelper
    def current_user #ログイン中のユーザー名
    　@current_user ||=User.find_by(id: session[:user_id])
    end
    
    def logged_in? #ログイン中か否か
        !!current_user
    end
end
