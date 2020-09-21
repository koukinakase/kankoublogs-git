class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show] 
  
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.order(id: :desc).page(params[:page]).per(5)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
