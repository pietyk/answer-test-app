require 'spec_helper'

describe Answer do
  before(:all) do 
    Poll.delete_all
    Answer.delete_all
    Question.delete_all
      
    poll     = Poll.create!(name: "Test 1")
    question = poll.questions.create(text: "Q1")
    @answer  = question.answers.create(text: "A1", is_correct: true)
  end
  
  describe "check valid answer" do
    it "empty text" do
      expect(Answer.create(text: "")).not_to be_valid
    end
  end
  
  describe "check added answer" do    
    it "count answers for first question" do
      expect(Answer.count).to eq(1)
    end
  end
  
  describe "delete answer" do
    before(:all) do
      @answer.destroy
    end
        
    it "check remove answers" do
      expect(Answer.count).to eq(0)
    end
  end
end
