require "spec_helper"

describe PollMail do
  describe 'send score' do
    let(:user) { mock_model User, email: 'test@email.com' }
    let(:mail) { PollMail.send_score(user, {}) }
 
    it 'renders the subject' do
      mail.subject.should == I18n.t('score_test')
    end
 
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end
  end
end
