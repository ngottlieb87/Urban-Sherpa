class ToursController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :authorize_guide || :authorize_admin, only: [:new,:edit,:create,:update,:destroy]
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

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:notice]= "Tour Created"
      redirect_to tours_path
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      flash[:notice] = "Tour Updated"
      redirect_to tours_path
    else
      render :edit
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    flash[:notice] = "Tour has been removed!"
    redirect_to tours_path
  end

  private

  def tour_params
    params.require(:tour).permit(:user_name, :photo, :title, :price, :description, :location, :date, :time, :user_id, :account_id)
  end
end
