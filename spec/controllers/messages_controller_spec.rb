require 'spec_helper'

describe MessagesController do

  before(:each) do

    @user1 = FactoryGirl.create(:user, :name => "Test_user1", :email => "test_user1@example.edu")
    @user2 = FactoryGirl.create(:user, :name => "Test_user2", :email => "test_user2@example.edu")

    @message1 = FactoryGirl.create(:message, :sender_id => 1, :recipient_id => 2, :subject => "Test1", :body => "This is a test message1")
    @message2 = FactoryGirl.create(:message, :sender_id => 2, :recipient_id => 1, :subject => "Test2", :body => "This is a test message2")

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        expect {
          message = FactoryGirl.create(:message, :sender_id => 2, :recipient_id => 1, :subject => "Test2", :body => "This is a test message2")

        }.to change(Message, :count).by(1)
      end
    end
  end

  describe "GET #index" do
    it "should check if the recepient has received the message" do
      #message = FactoryGirl.create(:message, :sender_id => 2, :recipient_id => 1, :subject => "Test2", :body => "This is a test message2")
      Message.find(:all, :conditions => {:recipient_id => 1}).count.should be(1)
    end

    it "should check if the sender has sent the message" do
      #message = FactoryGirl.create(:message, :sender_id => 2, :recipient_id => 1, :subject => "Test2", :body => "This is a test message2")
      Message.find(:all, :conditions => {:sender_id => 1}).count.should be(1)
    end
  end

end