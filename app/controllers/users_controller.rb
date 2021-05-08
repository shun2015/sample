class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
  end

  def updateend
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_validカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_valid)
  end
end
