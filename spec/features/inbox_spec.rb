require 'spec_helper'

describe "messages/index" do
  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user, :name => "Test_user2", :email => "test_user2@example.edu")
    @user3 = FactoryGirl.create(:user, :name => "Test_user3", :email => "test_user3@example.edu")
    @user4 = FactoryGirl.create(:user, :name => "Test_user4", :email => "test_user4@example.edu")

    @message_sent_by_user_1 = FactoryGirl.create(:message)
    @message_sent_by_user_2 = FactoryGirl.create(:message, :sender_id => 2, :recipient_id => 1)
    @message_sent_by_user_3 = FactoryGirl.create(:message, :sender_id => 3, :recipient_id => 1)
    @message_sent_by_user_4 = FactoryGirl.create(:message, :sender_id => 4, :recipient_id => 1)
  end

  it "renders the Message form" do
    sign_in_with_valid_credentials(@user1)
    visit user_messages_path(@user1)
    page.should have_content('Test_user2')
    page.should have_content(@message_sent_by_user_1.body)
  end
end
