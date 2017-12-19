class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_order = current_order.tour_orders.new
  end

  private

  def tour_params
    params.require(:tour).permit(:user_name, :price, :description, :location, :date, :time)
  end
end
