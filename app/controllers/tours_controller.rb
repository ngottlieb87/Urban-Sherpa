class ToursController < ApplicationController
  before_action :authorize_guide, only: [:edit,:create]
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_order = current_order.tour_orders.new
  end

  def new
    @tour = Tour.new
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def create
    @tour = Tour.find(params[:id])
    if @project.update(project_params)
      flash[:notice]= "Tour Created"
      redirect_to tours_path
    else
      render :edit
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:user_name, :price, :description, :location, :date, :time)
  end
end
