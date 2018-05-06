class CartsController < ApplicationController
before_action :authorize_cart, only: [:show]

  def show
    @tour_orders = current_order.tour_orders
  end
end
