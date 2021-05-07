class Admin::UsersController < ApplicationController
  before_action :if_not_admin #管理者以外topへ

  def index
    @users = User.all
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
