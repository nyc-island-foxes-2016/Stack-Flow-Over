class QuestionsController < ApplicationController
before_action :set_question, except: [:index, :new, :create, :show]
# you can skip before_action filters from application controller here 
# e.g. skip_before_action :ensure_current_user, only[:create, :new]
# would allow non-logged in users to ask questions

  def index
    @questions = Question.includes(:user).order(created_at: :desc)
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
        #Nice to use flash to inform user question was saved
        redirect_to root_url
      else
        #error message? you could render errors on the form if there are any
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
    # Think about having can_edit?(user) on the question
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
    # Don't allow user_id to come from the front end. Better would be
    # params.require(:question).permit(:body, :best_answer_id).merge(user: current_user)
    params.require(:question).permit(:body, :user_id, :best_answer_id)
  end
end
