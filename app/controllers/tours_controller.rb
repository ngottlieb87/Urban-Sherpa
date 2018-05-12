class ToursController < ApplicationController
before_action :authorize_guide_edit, only: [:edit, :update, :destroy]
before_action :is_guide?, only: [:new,:create]

  def index
    @tours = Tour.all
    if params[:sort] == "a_z"
      @tours = @tours.a_z
    elsif params[:sort] == "z_a"
      @tours = @tours.z_a
    elsif params[:sort] == "most_recent"
      @tours = @tours.most_recent
    elsif params[:sort] == "oldest"
      @tours = @tours.oldest
    elsif params[:sort] == "most_reviewed"
      @tours = @tours.most_reviewed
    end
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
      redirect_to "/tours/#{@tour.id}"
    else
      flash[:notice] = "Something went wrong! Check Fields!"
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
