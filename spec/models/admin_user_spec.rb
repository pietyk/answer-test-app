require 'spec_helper'

describe AdminUser do
  before do
    @user1 = AdminUser.create!(email: "email1@example.com", password: 'asdasd', password_confirmation: 'asdasd')
    @user2 = AdminUser.create!(email: "email2@example.com", password: 'asdasd', password_confirmation: 'asdasd')
  end
  
  it "not valid" do
    expect(AdminUser.create(email: "")).not_to be_valid
    expect(AdminUser.create(email: "email1@example.com", password: 'asdasd', password_confirmation: 'asdasd')).not_to be_valid
    expect(AdminUser.create(email: "email2@example.com", password: 'asdasd', password_confirmation: 'asdasd2')).not_to be_valid
  end

  it "count records" do
    expect(AdminUser.count).to eq(2)
  end
  
  it "orders by email" do
    expect(AdminUser.order('email ASC')).to eq([@user1.reload, @user2.reload])
  end
end
