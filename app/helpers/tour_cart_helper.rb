module TourCartHelper
  def tours_in_cart
    current_order.tour_orders.length
  end
end
