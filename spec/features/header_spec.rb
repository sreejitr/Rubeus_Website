require 'spec_helper'

describe 'check presence of Rubeus logo and header links' do
  it "is there" do
  visit root_path
    within ".navbar-inner" do
      src = "rubeus_logo_cropped.png"
      check_image(page,src)
    end
  end

  describe "Links on the header for signed in user" do

    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_with_valid_credentials(@user)
    end

    it "should redirect to home page" do
      click_link Rubeus::HOME
      current_path.should ==  root_path
    end

    it "should redirect to Products page" do
      click_link Rubeus::PRODUCTS
      click_link Rubeus::ALL_PRODUCTS
      current_path.should == products_path
    end

    it "should redirect to offers page" do
      click_link Rubeus::OFFERS
      current_path.should == offers_path
    end

    it "should redirect to messages page" do
      click_link Rubeus::MESSAGES
      current_path.should == user_messages_path(@user)
    end

    it "should redirect to user's profile page" do
      click_link Rubeus::PROFILE
      click_link Rubeus::MY_PROFILE
      current_path.should == user_path(@user)
    end

    it "should redirect to user's profile edit page" do
      click_link Rubeus::PROFILE
      click_link Rubeus::EDIT_PROFILE
      current_path.should == edit_user_path(@user)
    end

  end

end


