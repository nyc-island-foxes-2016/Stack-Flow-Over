class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
