class ApplicationController < ActionController::Base
    
    include SessionsHelper

    private
    
    def login_now?
        unless logged_in? #ログインしてなかったら実行
         redirect_to sessions_new_path
        end
    end
end
