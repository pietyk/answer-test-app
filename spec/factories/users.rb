FactoryGirl.define do 
  factory :user do |f|
    f.email "emailtestapp@example.com"
    f.password 'asdasd'
    f.password_confirmation 'asdasd'
  end
end
