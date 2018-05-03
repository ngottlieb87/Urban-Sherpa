class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    account = Account.new

    if @user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      account.user_id = @user.id
      account.save
      redirect_to '/'
    else
      flash[:notice] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @account = Account.find(current_user.id)
    @account.destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account Removed!"
    redirect_to tours_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :admin, :guide, :password, :password_confirmation, :avatar, :id)
  end

end
