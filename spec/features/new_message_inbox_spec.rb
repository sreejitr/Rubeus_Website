require 'spec_helper'

describe "integration test for messages" do

  before(:each) do
    @seller = FactoryGirl.create(:user, :email => 'rashmi@impossible.edu')
    @buyer = FactoryGirl.create(:user)
    @product = FactoryGirl.create(:product)
    @second_message = "Second message"
    sign_in_with_valid_credentials (@seller)
    offer = FactoryGirl.create(:offer)
    visit offers_path
    expect(page).to have_content(@product.title)
    expect(page).to have_content(@buyer.name)
    expect(page).to have_link(Rubeus::WITHDRAW)
    expect(page).to have_link(Rubeus::SEND_MESSAGE)
    click_link Rubeus::SEND_MESSAGE
    expect(page).to have_content(Rubeus::COMPOSE_MESSAGE)
    fill_in 'Body', :with => Rubeus::TEST_MESSAGE
    click_button 'Send'
    expect(page).to have_content 'Message sent'
  end

  it "should create valid message from the offer link" do
    visit offers_path
    click_link Rubeus::SEND_MESSAGE
    expect(page).to have_content(@seller.name)
    expect(page).to have_content(Rubeus::TEST_MESSAGE)
  end

  it "Reply to a conversation" do
    fill_in 'Body', :with => @second_message
    click_button Rubeus::REPLY
    expect(page).to have_content(@seller.name)
    expect(page).to have_content(Rubeus::TEST_MESSAGE)
    expect(page).to have_content(@second_message)
  end

end