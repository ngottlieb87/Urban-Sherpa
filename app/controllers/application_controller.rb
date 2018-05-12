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

  def user_comment
    current_user.id === @tour.comment.user_id
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

  def guide_edit
    current_user.id === @tour.user_id
  end
  # def authorize_admin
  #   if !current_user.admin
  #     flash[:alert] = 'Admin Only!'
  #     redirect_to tours_path
  #   end
  # end
  #
  def authorize_guide_edit
    @tour = Tour.find(params[:id])
    if !current_user || !guide_edit
      flash[:alert] = 'You do not have access to change this tour!'
      redirect_to tours_path
    end
  end

  def authorize_is_guide?
    if !is_guide?
      flash[:alert] = 'Must be a guide to create tour!'
      redirect_to tours_path
    end
  end

  def current_order
    if session[:order_id] && Order.find(session[:order_id]).status != "paid"
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
