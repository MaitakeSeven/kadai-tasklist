class SessionsController < ApplicationController
  def new
  end

  def create
     email = params[:session][:email].downcase
     password = params[:session][:password]
     if login(email,password)#loginメソッドを実行
        flash[:success] = "ログインに成功しました"
        redirect_to root_path
     else
        flash.now[:danger] = "ログインに失敗しました"
        render :new
     end
  end

  def destroy #ログアウト
      session[:user_id] = nil
      flash[:success] = "ログアウトしました"
      redirect_to root_path
  end
  
  private
  
  def login(email,password)
    @user = User.find_by(email: email)#入力したemailをテーブルから検索
    if @user && @user.authenticate(password)
      #アドレスが存在しないとnilが代入される
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
      
end
