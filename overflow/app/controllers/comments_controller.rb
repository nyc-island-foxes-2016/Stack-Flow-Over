class CommentsController < ApplicationController
  def new
    if logged_in?
      @comment = Comment.new
    else
      @errors = ["Please log in to post a comment"]
      render :'sessions/new'
    end
  end

=begin
If your routes are
     question_comments POST   /questions/:question_id/comments(.:format)     comments#create
     answer_comments POST   /answers/:answer_id/comments(.:format)         comments#create
     you could do something like 
      http://stackoverflow.com/questions/23088709/finding-parent-in-rails-polymorphic-association

    def find_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    It's a bit clever-clever but makes life simpler if you ever make something else commentable
=end


  def create
     comment = Comment.new(comment_params)

    if !!params[:question_id]
      comment.commentable_id = params[:question_id]
      comment.commentable_type = "Question"
      redirect_path_name = params[:question_id]
    else
      comment.commentable_id = params[:answer_id]
      comment.commentable_type = "Answer"
      redirect_path_name = Answer.find(params[:answer_id]).question_id
    end

    comment.user_id =  current_user.id

    if comment.save
      redirect_to question_path(redirect_path_name)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
