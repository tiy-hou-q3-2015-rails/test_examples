class FollowingController < ApplicationController

  before_action :authenticate_user!

  def create
    new_user = User.find params[:id]
    @current_user.follow new_user
    redirect_to root_path, notice: "You have followed #{new_user.email}"
  end

  def delete
    new_user = User.find params[:id]
    @current_user.stop_following new_user
    redirect_to root_path, notice: "You have stopped following #{new_user.email}"

  end
end
