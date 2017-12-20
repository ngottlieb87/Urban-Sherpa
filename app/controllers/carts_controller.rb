class CartsController < ApplicationController
    before_action :authorize, only: [:show]
  def show
    @tour_orders = current_order.tour_orders
  end
end
