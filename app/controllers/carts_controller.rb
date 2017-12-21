class CartsController < ApplicationController

  def show
    @tour_orders = current_order.tour_orders
  end
end
