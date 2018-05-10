class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_admin?
  helper_method :is_guide?
  helper_method :current_order
  helper_method :authorize_guide

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def is_admin?
    current_user && current_user.admin
  end

  def is_guide?
    current_user && current_user.guide
  end

  def authorize
    if !current_user
      flash[:alert] = 'Please sign in/Create account to access'
      redirect_to tours_path
    end
  end

  def authorize_cart
    if !current_user
      flash[:alert] = 'Please sign in to access cart'
      redirect_to tours_path
    end
  end

  # def authorize_admin
  #   if !current_user.admin
  #     flash[:alert] = 'Admin Only!'
  #     redirect_to tours_path
  #   end
  # end
  # 
  # def authorize_guide
  #   @tour = Tour.find(params[:id])
  #   if i == @tour.user.id
  #     binding.pry
  #     flash[:alert] = 'You must be a guide to create a tour!'
  #     redirect_to tours_path
  #   end
  # end

  def current_order
    if session[:order_id] && Order.find(session[:order_id]).status != "paid"
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
