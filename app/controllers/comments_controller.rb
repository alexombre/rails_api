class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  
  def index
    @comments = Comment.all.select{|com| com.image_id == params[:image_id].to_i }
    render json: @comments
  end

  def create
    @comment = Comment.create(comment_params.merge(user_id: current_user.id).merge(image_id: params[:image_id].to_i))
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: @comment.errors }, status: :unprocessable_entity
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
