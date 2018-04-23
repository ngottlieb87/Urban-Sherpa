class TourOrdersController < ApplicationController
  before_action :authorize, only: [:create]
  def create
    @tour_orders = current_order.tour_orders
    @order = current_order
    @tour = @order.tour_orders.new(tour_params)
    @order.account_id = current_user.id
    @order.save!
    session[:order_id] = @order.id
    flash[:notice] = "Tour added to Your Itinerary"
    redirect_to tours_path
  end

  def destroy
    @tour_orders = current_order.tour_orders
    @account = Account.find(current_user.id)
    @open_orders = @account.orders
    @order = current_order
    @tour = @order.tour_orders.find(params[:id])
    @tour.destroy
    @order.save
    flash[:notice] = "Tour Removed"
    redirect_to cart_path
  end

  private

  def tour_params
    params.require(:tour_order).permit(:quantity,:tour_id)
  end
end
