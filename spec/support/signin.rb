module UserHelper
  def signed(user=nil)
    user = user || FactoryGirl.create(:user)
    sign_in user
  end
end
