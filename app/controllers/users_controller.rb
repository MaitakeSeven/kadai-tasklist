class UsersController < ApplicationController
  before_action :login_now?,only:[:index,:show]
  
  def index
    #ユーザー一覧
  end

  def show
    #ユーザー詳細ページ
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました"
      redirect_to root_path
    else
      flash[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
    #ユーザー保存アクション
    #保存成功でトップページに偏移
  end
  
  def new
    #ユーザー登録ページ
    @user = User.new
  end
  
  private
  
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
