class QuestionsController < ApplicationController

before_action :set_question, except: [:index, :new, :create]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.includes(:comments).find(params[:id])
  end

  def create
    if current_user
      @question = Question.new(q_params)
      if @question.save
        redirect_to root_url
      else
        render :new
      end
    else
      @errors = "Please log in to ask a question"
      render :new_session_path
    end
  end

  def edit
  end

  def update
    if @question.update_attributes(q_params)
      redirect_to @todo
    else
      render :edit
    end
  end

private

  def set_question
    @question = Question.find(params[:id])
  end

  def q_params
    params.require(:question).permit(:body, :user_id, :best_answer_id)
  end
end
