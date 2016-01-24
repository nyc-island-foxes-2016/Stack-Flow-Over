require 'spec_helper'

describe QuestionsController do
  let(:question) {FactoryGirl.create :question}

  describe "#index" do
    it "assigns the questions to Question.all" do
      get :index
      expect(response).to be_success
    end

    it "populates an array of questions" do
      question = FactoryGirl.create(:question)
      get :index
      assigns(:questions).should eq([question])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end

  end



end
