class CommentsController < ApplicationController

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

  private

  def comment_params
    params.require(:comment).permit(:body,:user_id,:tour_id)
  end
end
