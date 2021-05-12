class Admin::UsersController < ApplicationController
  before_action :if_not_admin #管理者以外topへ

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_valid)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
