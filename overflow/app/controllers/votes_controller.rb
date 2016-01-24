class VotesController < ApplicationController
  def new
    @vote = Vote.new(vote_params).save
    binding.pry
  end

  def create
    binding.pry
    @vote = Vote.new(vote_params)
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
