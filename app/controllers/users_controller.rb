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
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      account.user_id = @user.id
      account.save
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @tour_info = current_user.account.orders.find(params[:id])
    # find relation to tour from user Profile
    binding.pry
    flash[:notice] = "Tour has been removed!"
    redirect_to "/users/#{current_user.id}"
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :admin, :guide, :password, :password_confirmation, :avatar, :id)
  end


end
