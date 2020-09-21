class BlogsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @blog=current_user.blogs.build 
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      @prefectures=Prefecture.order(id: :asc)
      render 'toppages/index'
    end
  end

  def edit
    @blog=Blog.find(params[:id])
  end

  def update
    @blog=Blog.find(params[:id])
    if @blog.update(blog_params)
       flash[:success] = 'ブログを編集しました。'
       redirect_to user_path(current_user)
      else
       flash[:danger] = 'ブログを編集できませんでした。'
       render :edit
    end
  end

  def destroy
    @blog.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def blog_params
    params.require(:blog).permit(:prefecture_id,:spot_name,:image1, :image2,:address, :content)
  end
  
  def correct_user
    @blog = current_user.blogs.find_by(id: params[:id])
    unless @blog
      redirect_to root_url
    end
  end
  
end
