class LinksController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.where("id != ?", @current_user.id)
    @people = @current_user.following_users
  end
end
