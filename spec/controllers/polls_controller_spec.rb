require 'spec_helper'

describe PollsController do
  before(:all) do
    @poll = Poll.create!(name: "Test poll")
    q1    = @poll.questions.create(text: "Q1")
    q2    = @poll.questions.create(text: "Q2")
    q1.answers.create(text: "A1", is_correct: true)
    q1.answers.create(text: "A2", is_correct: true)
    q2.answers.create(text: "A1", is_correct: true)
    q2.answers.create(text: "A2", is_correct: false)
  end
  
  before do
    signed
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: @poll.slug
      expect(response).to be_success
    end
    
    it "renders the show template" do
     get 'show', id: @poll.slug
     expect(response).to render_template("show")
    end
    
    it "no exist id" do
     get 'show', id: 'a'

     expect(response).to redirect_to root_path
    end
    
    it "check data poll" do
     get 'show', id: @poll.slug
     assigns(:poll).should eq(@poll)
    end
  end

  describe "GET 'create'" do
    before do
      post :create, answers: [1,2,3], id: @poll.slug
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the create template" do
      expect(response).to render_template("create")
    end
  end
end
