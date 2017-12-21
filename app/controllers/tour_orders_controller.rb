class TourOrdersController < ApplicationController
  before_action :authorize, only: [:create]
  def create
    @tour_orders = current_order.tour_orders
    @order = current_order
    @tour = @order.tour_orders.new(tour_params)
    @order.account_id = current_user.id
    binding.pry
    @order.save!

    session[:order_id] = @order.id
    flash[:notice] = "Tour added to Your Itinerary"
    redirect_to tours_path
  end

  private

  def tour_params
    params.require(:tour_order).permit(:quantity,:tour_id)
  end
end
