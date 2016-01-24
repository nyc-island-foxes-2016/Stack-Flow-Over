require 'spec_helper'

describe QuestionsController do
  let(:question) {FactoryGirl.create :q_with_answers}

  describe "#index" do
    it "assigns the questions to Question.all" do
      get :index
      expect(response).to be_success
    end

    it "populates an array of questions" do
      get :index
      assigns(:questions).should eq([question])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "#show" do
    it "assigns the requested question to @question" do
      get :show, id: question
      assigns(:question).should eq(question)
    end

    it "renders the :show view" do
      get :show, id: question
      response.should render_template :show
    end

    it "populates an array of answers associated with the question" do
      get :show, id: question
      assigns(:question).answers.should eq(question.answers)
    end


  end

  describe "#edit" do
    it "assigns the requested question to @question" do
      get :edit, id: question
      assigns(:question).should eq(question)
    end

    it "renders the :show view" do
      get :edit, id: question
      response.should render_template :'sessions/new'
    end

  end


end
