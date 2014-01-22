require 'spec_helper'

describe Poll do
  before(:all) do
    Poll.delete_all
    Answer.delete_all
    Question.delete_all
    
    @poll = Poll.create!(name: "Test 1")
    q1    = @poll.questions.create(text: "Q1")
    q2    = @poll.questions.create(text: "Q2")
    q1.answers.create(text: "A1", is_correct: true)
    q1.answers.create(text: "A2", is_correct: true)
    q2.answers.create(text: "A1", is_correct: true)
    q2.answers.create(text: "A2", is_correct: false)
  end
  
  describe "check valid poll" do
    it "empty name" do
      expect(Poll.create(name: "")).not_to be_valid
    end
  end
  
  describe "check added poll" do
    it "check slug" do
      expect(@poll.slug).to eq('test-1')
    end
    
    it "count polls" do
      expect(Poll.count).to eq(1)
    end
    
    it "count questions" do
      expect(@poll.questions.count).to eq(2)
    end
    
    it "count answers for first question" do
      expect(@poll.questions.first.answers.count).to eq(2)
    end
  end
  
  describe "check solution poll" do
    it "all correct answers" do
      answers = [@poll.questions[0].answers[0].id, @poll.questions[0].answers[1].id,
                 @poll.questions[1].answers[0].id]
      expect(@poll.generate_score(answers)).to eq({'Q1' => true, 'Q2' => true})
    end
    
    it "one correct answer" do
      answers = [@poll.questions[0].answers[0].id, @poll.questions[1].answers[0].id]
      expect(@poll.generate_score(answers)).to eq({'Q1' => false, 'Q2' => true})
    end
  end
  
  describe "delete poll" do
    before(:all) do
      @poll.destroy
    end
        
    it "check remove answers" do
      expect(Answer.count).to eq(0)
    end
    
    it "check remove questions" do
      expect(Question.count).to eq(0)
    end
    
    it "check remove poll" do
      expect(Poll.count).to eq(0)
    end
  end
end
