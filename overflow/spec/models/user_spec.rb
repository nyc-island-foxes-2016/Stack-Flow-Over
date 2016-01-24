require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of :name }
  end

  context "#name" do
    let(:user) { FactoryGirl.build :user, :name => "sample_user" }
    it "sets the name properly" do
      user.save
      expect(user.name).to eq "sample_user"
    end
  end
end