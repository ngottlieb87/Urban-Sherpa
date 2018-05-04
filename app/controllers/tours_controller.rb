class ToursController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @tour_order = current_order.tour_orders.new
  end

  def new
    @tour = Tour.new
    unless current_user && current_user.guide || is_admin?
      flash[:notice] = "Must Be A Guide To Create Tours"
      redirect_to tours_path
    end
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
    unless @tour.user_id === current_user.id || is_admin?
      flash[:notice] = "Not your tour to update"
      redirect_to tours_path
    end
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      flash[:notice] = "Tour Updated"
      redirect_to tours_path
    else
      flash[:notice] = "oops"
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
