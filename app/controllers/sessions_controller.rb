class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "Welcome back #{@user.user_name}"
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_to '/' }
        format.js
      end
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      respond_to do |format|
        format.html { redirect_to '/' }
        format.js
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to '/'
  end
end
