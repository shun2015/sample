class Admin::PostsController < ApplicationController
  before_action :if_not_admin

  def index
    @posts = Post.all
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
