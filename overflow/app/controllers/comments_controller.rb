class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    comment.commentable_id = params[:question_id]
    comment.commentable_type = "Question"
    comment.user_id =  current_user.id
    if comment.save
      redirect_to question_path(params[:question_id])
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
