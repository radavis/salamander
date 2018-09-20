class SessionsController < ApplicationController
  def new
    if params[:message].present?
      flash.now[:alert] = "There was a problem authenticating. Please try again."
      @omniauth_error = params[:message]
    end
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    reset_session
    session[:user_id] = user.id
    redirect_to root_path, notice: "Welcome, #{current_user}!"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You have signed out."
  end
end
