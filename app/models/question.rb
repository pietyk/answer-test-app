class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :answers, :dependent => :destroy
  
  validates :text, :presence => true
  
  attr_accessible :text
  
  def display_name
    self.text
  end
end
