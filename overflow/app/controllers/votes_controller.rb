class VotesController < ApplicationController
  def new
    if logged_in?
      @vote = Vote.new
      if @vote.has_voted?(vote_params)
        @errors = ["You've already voted on this post"]
        render :'new'
      else
        @vote = Vote.create(vote_params)
      end
    else
      @errors = ["You must be logged in to vote"]
      render :'sessions/new'
    end
  end

  def create
  end

  private

  def vote_params
    {vote_type: params[:vote_type], user_id: current_user.id, voteable_type: voteable_type_setter, voteable_id: voteable_id_setter }
  end

  def voteable_type_setter
    if params[:question_id]
      voteable_type = "Question"
    elsif params[:comment_id]
      voteable_type = "Comment"
    elsif params[:answer_id]
        voteable_type = "Answer"
    end
  end

  def voteable_id_setter
    if params[:question_id]
      voteable_id = params[:question_id]
    elsif params[:comment_id]
      voteable_id = params[:comment_id]
    elsif params[:answer_id]
      voteable_id = params[:answer_id]
    end
  end

end
