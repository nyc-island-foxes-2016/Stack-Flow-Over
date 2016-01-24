class CommentsController < ApplicationController
  def new
    if logged_in?
      @comment = Comment.new
    else
      @errors = ["Please log in to post a comment"]
      render :'sessions/new'
    end
  end

  def create
    comment = Comment.new(comment_params)
    comment.commentable_id = params[:question_id]
    # if !!params[:question_id]
    #   comment.commentable_id = params[:question_id]
      comment.commentable_type = "Question"
    #   redirect_path_name = params[:question_id]
    # else
    #   comment.commentable_id = params[:answer_id]
    #   comment.commentable_type = "Answer"
    #   redirect_path_name = Answer.find(params[:answer_id]).question_id
    # end
    comment.user_id =  current_user.id
    if comment.save
      redirect_to question_path(params[:question_id])
      # redirect_to question_path(redirect_path_name)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
