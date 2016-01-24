require 'spec_helper'

describe QuestionsController do
  let(:question) {FactoryGirl.create :question}

  describe "#index" do
    it "assignes the questions to Question.all" do
      get :index
      expect(response).to be_success
    end
  end

end
