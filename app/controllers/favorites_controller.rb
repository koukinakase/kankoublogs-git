class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    blog = Blog.find(params[:blog_id])
    current_user.favorite(blog)
    flash[:success] = 'お気に入り追加しました。'
    redirect_to likes_user_path(current_user)
  end
  
  def destroy
    blog = Blog.find(params[:blog_id])
    current_user.unfavorite(blog)
    flash[:success] = 'お気に入り追加を解除しました。'
    redirect_to likes_user_path(current_user)
  end
end
