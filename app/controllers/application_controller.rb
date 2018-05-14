class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_admin?
  helper_method :is_guide?
  helper_method :current_order
  helper_method :authorize_guide
  helper_method :authorize_guide_edit

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def user_comment
    if !current_user
      flash[:alert]="Please Sign In"
      redirect_to tours_path
    else
    @comment = Comment.find(params[:id])
    current_user.id === @comment.user_id || is_admin?
    end
  end

  def is_admin?
    current_user && current_user.admin
  end

  def is_guide?
    current_user && current_user.guide || is_admin?
  end

  def authorize
    if !current_user
      flash[:alert] = 'Please sign in/Create account to access'
      redirect_to tours_path
    end
  end

  def authorize_comment_edit
    if !user_comment
      flash[:alert]= "Not your comment to edit/delete"
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
    @tour = Tour.find(params[:id])
    current_user.id === @tour.user_id || is_admin?
  end

  def authorize_guide_edit
    if !guide_edit
      flash[:alert] = 'You do not have access to change this tour!'
      redirect_to tours_path
    end
  end

  def authorize_is_guide?
    if !is_guide?
      flash[:alert] = 'Must be a guide to create tours!'
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
