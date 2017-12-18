class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end

  private

  def tour_params
    params.require(:tour).permit(:user_name, :price, :description, :location, :date, :time)
  end
end
