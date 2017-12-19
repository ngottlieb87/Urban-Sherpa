module TourCartHelper
  def tour_cart
    current_order.tour_orders.length
  end
end
