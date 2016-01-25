class AnswersController < ApplicationController
  def new
    if logged_in?
      @answer = Answer.new
    else
      @errors = ["Please log in to post an answer"]
      render :'sessions/new'
    end
  end

  def create
    answer = Answer.new(answer_params)
    answer.question_id = params[:question_id]
    answer.user = current_user
    if answer.save
      redirect_to question_path(params[:question_id])
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
