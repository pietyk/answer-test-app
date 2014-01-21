# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#user
User.create!(:email => 'test@test.pl', :password => '123456', :password_confirmation => '123456')

#test
test      = Poll.create(:name => 'Test 1')
question1 = test.questions.create(:text => 'Question 1')
question1.answers.create(:text => 'Answer 1', :is_correct => true)
question1.answers.create(:text => 'Answer 2', :is_correct => false)
question1.answers.create(:text => 'Answer 3', :is_correct => true)
question2 = test.questions.create(:text => 'Question 2')
question2.answers.create(:text => 'Answer 1', :is_correct => true)
question2.answers.create(:text => 'Answer 2', :is_correct => false)
question2.answers.create(:text => 'Answer 3', :is_correct => false)
question3 = test.questions.create(:text => 'Question 3')
question3.answers.create(:text => 'Answer 1', :is_correct => true)
question3.answers.create(:text => 'Answer 2', :is_correct => false)
question3.answers.create(:text => 'Answer 3', :is_correct => true)
question3.answers.create(:text => 'Answer 4', :is_correct => true)
