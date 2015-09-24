class SessionsController < ApplicationController

  def new
  end

  def create

    # get email/pw from form
    email = params[:email]
    password = params[:password]
    # find user from the email
    user = User.find_by email: email
    # authenticate the password
    if user.present? && user.authenticate(password)
      # session & redirect or render
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
  end
end
