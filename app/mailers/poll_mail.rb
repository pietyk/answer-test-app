class PollMail < ActionMailer::Base
  default from: "no-reply@answer-test-app.herokuapp.com"
  
  def send_score(user, score)
    @score = score
    mail(:to => user.email, :subject => I18n.t('score_test'))
  end
end
