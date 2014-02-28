class CommentsController < ApplicationController

  # before_action :check_logged_in, only: [:create, :destroy]

  def create
    @link = Link.find(params[:link_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = @link.id

    if @comment.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(@link) # send to anchor link for parent comment
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:parent_comment_id, :body)
  end
end
