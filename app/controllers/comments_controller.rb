class CommentsController < ApplicationController
before_action :authorize, only: [:new, :create, :show]
before_action :authorize_comment_edit, only: [ :edit, :update, :destroy]

  def new
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.new
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment Added!"
      redirect_to tour_path(@tour.id)
    else
      flash[:notice] = "Comment field can't be blank"
      redirect_to tour_path(@tour.id)
    end
  end

  def edit
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment Updated"
      redirect_to "/tours/#{@tour.id}"
    else
      flash[:alert] = "Failed To Update Comment"
      redirect_to "/tours/#{@tour.id}"
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @comment = @tour.comments.find(params[:tour_id])
    @comment.destroy
    flash[:notice] = "Comment Removed"
    redirect_to "/tours/#{@tour.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:user_id,:tour_id,:id)
  end
end
