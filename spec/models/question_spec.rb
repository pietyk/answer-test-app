require 'spec_helper'

describe Question do
  before(:all) do
    Poll.delete_all
    Answer.delete_all
    Question.delete_all
    
    poll      = Poll.create!(name: "Test 1")
    @question = poll.questions.create(text: "Q1")
    @question.answers.create(text: "A1", is_correct: true)
    @question.answers.create(text: "A2", is_correct: true)
  end
  
  describe "check valid question" do
    it "empty text" do
      expect(Question.create(text: "")).not_to be_valid
    end
  end
  
  describe "check added question" do    
    it "count questions" do
      expect(Question.count).to eq(1)
    end
    
    it "count answers for first question" do
      expect(@question.answers.count).to eq(2)
    end
  end
  
  describe "delete question" do
    before(:all) do
      @question.destroy
    end
        
    it "check remove answers" do
      expect(Answer.count).to eq(0)
    end
    
    it "check remove questions" do
      expect(Question.count).to eq(0)
    end
  end
end
