ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com",
  :port  => 587,
  :user_name  => "answertestapp2@gmail.com",
  :password  => "ANSWERtest",
  :authentication  => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp

