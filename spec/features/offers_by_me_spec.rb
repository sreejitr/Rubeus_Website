require 'spec_helper'

describe "integration test for offers made by me" do
  
	before(:each) do
    @seller = FactoryGirl.create(:user, :email => 'rashmi@impossible.edu')
    @buyer = FactoryGirl.create(:user)
    @product = FactoryGirl.create(:product)
    sign_in_with_valid_credentials(@seller)
    @offer = FactoryGirl.create(:offer)
  end

  it "valid view of offers by me" do

      visit offers_path
      expect(page).to have_content(@product.title)
      expect(page).to have_content(@buyer.name)
      expect(page).to have_link(Rubeus::WITHDRAW)
      expect(page).to have_link(Rubeus::SEND_MESSAGE)
  end
  it "check if the offers link works" do
    click_link 'Offers'
    expect(page).to have_content(@product.title)
    expect(page).to have_content(@buyer.name)
    expect(page).to have_link(Rubeus::WITHDRAW)
    expect(page).to have_link(Rubeus::SEND_MESSAGE)
  end

  it "check if withdraw button works" do
    click_link 'Offers'
    expect(page).to have_content(@product.title)
    expect(page).to have_content(@buyer.name)
    expect(page).to have_link(Rubeus::WITHDRAW)
    click_link Rubeus::WITHDRAW
    expect(page).to_not have_content(@product.title)
    expect(page).to_not have_content(@buyer.name)
  end

end