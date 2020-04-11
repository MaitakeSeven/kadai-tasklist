module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #ログイン中のアカウントIDを代入 
  end

  def logged_in?
    !!current_user
  end
  
end