class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_admin?
  helper_method :is_guide?
  helper_method :current_order

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
      flash[:alert] = 'Please sign in to access'
      redirect_to tours_path
    end
  end

  def authorize_admin
    if !current_user
      flash[:alert] = 'Please Sign in to join tour!'
      redirect_to tours_path
    end
  end

  def authorize_guide
    if !current_user.guide
      flash[:alert] = 'You must be a guide to create a tour!'
      redirect_to tours_path
    end
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

end
