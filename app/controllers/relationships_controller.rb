class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  #フォローするとき
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    # 非同期のためにリダイレクト先を消し、
    # redirect_to request.referer
    # 新たに非同期用のjsフィルを指定
    render 'replace_index_btn'
  end

  #フォローを外すとき
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    # 非同期のためにリダイレクト先を消す
    # redirect_to request.referer
    # 新たに非同期用のjsフィルを指定
    render 'replace_index_btn'
  end

  #フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users =user.followings
  end

  #フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users =user.followers
  end

end
