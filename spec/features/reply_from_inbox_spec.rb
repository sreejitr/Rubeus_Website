require 'spec_helper'

describe "integration test for messages" do

  before(:each) do
    @recipient = FactoryGirl.create(:user, :email => 'rashmi@impossible.edu')
    @sender = FactoryGirl.create(:user)
    @message = FactoryGirl.create(:message, :recipient_id => @recipient.id, :sender_id => @sender.id)
  end
 #This needs to be modified when you change the compose form
  it "should create valid message from the reply link" do
    sign_in_with_valid_credentials(@recipient)
    visit user_path(@recipient.id)
    expect(page).to have_link(Rubeus::MESSAGES)
    visit user_messages_path(@recipient.id)
    #first(:css, '.messages').click_link Rubeus::REPLY
    visit new_user_message_path(@sender, :recipient_id => @sender.id)
    expect(page).to have_content(Rubeus::COMPOSE_MESSAGE)
   # fill_in 'Subject', :with => "Hello"
    fill_in 'Body', :with => "Test Message"
    click_button 'Send'
    expect(page).to have_content 'Message sent'
  end
end