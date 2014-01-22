class Poll < ActiveRecord::Base
  extend FriendlyId
  
  has_many :questions, :dependent => :destroy

  validates :name, :presence => true
  
  attr_accessible :name, :slug
  
  friendly_id :name, use: :slugged
  
  human_name = 'Testy'
  
  def generate_score(answers)
    score   = {}
    answers = answers.map(&:to_i)
    questions.each do |question|
      correct = true
      question.answers.each do |answer|
        if answer.is_correct?
          unless answers.include?(answer.id)
            correct = false
            break
          end
        else 
          if answers.include?(answer.id)
            correct = false
            break
          end
        end
      end unless question.answers.first.nil?
      score[question.text] = correct
    end unless questions.first.nil?
    
    score
  end
end
