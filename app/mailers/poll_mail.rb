class PollMail < ActionMailer::Base
  default from: "answertestapp@gmail.com"
  
  def send_score(user, score)
    @score = score
    mail(:to => user.email, :subject => I18n.t('score_test'))
  end
end
