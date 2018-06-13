class ChargesController < ApplicationController
  before_action :authorize
  def new
    @amount = current_user.account.orders.last.total_price
    @tour_orders = current_order.tour_orders
  end

  def create
    # Amount in cents
    @amount = current_user.account.orders.last.total_price
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount * 100).to_i,
      :description => 'Rails Stripe Customer',
      :currency    => 'usd'
    )
    current_order.update(:status => "paid");
    session[:order_id] = nil
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
