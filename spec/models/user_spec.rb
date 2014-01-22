require 'spec_helper'

describe User do
  before do
    @user1 = User.create!(email: "email1@example.com", password: 'asdasd', password_confirmation: 'asdasd')
    @user2 = User.create!(email: "email2@example.com", password: 'asdasd', password_confirmation: 'asdasd')
  end
  
  it "not valid" do
    expect(User.create(email: "")).not_to be_valid
    expect(User.create(email: "email1@example.com", password: 'asdasd', password_confirmation: 'asdasd')).not_to be_valid
    expect(User.create(email: "email2@example.com", password: 'asdasd', password_confirmation: 'asdasd2')).not_to be_valid
  end
  
  it "count records" do
    expect(User.count).to eq(2)
  end
  
  it "orders by email" do
    expect(User.order('email ASC')).to eq([@user1.reload, @user2.reload])
  end
end
