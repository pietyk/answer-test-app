class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :answers, :dependent => :delete_all
  
  validates :text, :presence => true
  
  attr_accessible :text
end
