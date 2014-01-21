class Answer < ActiveRecord::Base
  belongs_to :question
  
  validates :text, :presence => true
  validates_inclusion_of :is_correct, :in => [true, false]

  attr_accessible :is_correct, :text
end
