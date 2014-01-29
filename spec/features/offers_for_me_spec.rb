require 'spec_helper'

describe "integration test for offers made by me" do
  
	before(:each) do
    @seller = FactoryGirl.create(:user, :email => 'rashmi@impossible.edu')
    @buyer = FactoryGirl.create(:user)
    @product = FactoryGirl.create(:product)
  end

  it "check if offers are displayed correctly for the seller on the product page" do
    sign_in_with_valid_credentials(@buyer)
 	  @offer = FactoryGirl.create(:offer, :buyer_id => @buyer.id, :product_id => @product.id)
    click_link 'Sign Out'
    sign_in_with_valid_credentials(@seller)
    visit product_path(@product)
    expect(page).to have_content(@seller.name)
   	expect(page).to have_link(Rubeus::ACCEPT)
    expect(page).to have_link(Rubeus::SEND_MESSAGE)
  end
end