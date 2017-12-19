class CartsController < ApplicationController
  def show
    @tour_orders = current_order.tour_orders
    @account = Account.find(current_user.id)
  end
end
