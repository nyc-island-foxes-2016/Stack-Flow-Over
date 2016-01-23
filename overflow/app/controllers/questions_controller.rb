class QuestionsController < ApplicationController

before_action :set_question, except: [:index, :new, :create, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    if !current_user
      @errors = ["Please log in to ask a question"]
      render :'sessions/new'
    end
  end

  def show
     @question = Question.includes(comments: [:user], answers: [:user, comments: [:user]]).find(params[:id])
  end

  def create
    if current_user
      @question = current_user.questions.new(q_params)
      if @question.save
        redirect_to root_url
      else
        render :new
      end
    else
      @errors = ["Please log in to ask a question"]
      render :questions_path
    end
  end

  def edit
    if !current_user
      @errors = ["Sorry, you must be the author of this question to edit it."]
      render :'sessions/new'
    end
  end

  def update
    if current_user == @question.user
      if @question.update_attributes(q_params)
        redirect_to @question
      else
        render :edit
      end
    else
      @errors = ["Sorry, you must be the author of this question to edit it."]
      render :'sessions/new'
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
