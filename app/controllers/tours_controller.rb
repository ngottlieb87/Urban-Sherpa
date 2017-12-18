class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  private

  def tour_params
    params.require(:tour).permit(:user_name, :price, :description, :location, :date, :time)
  end
end
