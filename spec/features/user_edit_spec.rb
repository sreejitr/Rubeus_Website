require 'spec_helper'

describe "Signed In User can edit their profile"  do
  before :each do
    @user = FactoryGirl.create(:user)
   sign_in_with_valid_credentials(@user)
  end

  describe "Edit page" do

    before :each do
      visit edit_user_path(@user.id)
    end

    it "has header" do
      page.should have_content(Rubeus::EDIT_PROFILE_INFO)
    end

    it "has a Username field" do
      page.should have_content(Rubeus::NAME)
    end

    it "has Phone no field" do
      page.should have_field(Rubeus::PHONE_NO)
    end

    it "has Address field" do
      page.should have_field(Rubeus::ADDRESS)
    end

    it "has City field" do
      page.should have_field(Rubeus::CITY)
    end

    it "has State field" do
      page.should have_field(Rubeus::STATE)
    end

    it "has Zip code field" do
      page.should have_field(Rubeus::ZIP_CODE)
    end

    it "has button to save all changes" do
      page.should have_button(Rubeus::SAVE_CHANGES)
    end

    it "has link to Discard all changes" do
      page.should have_link (Rubeus::DISCARD_CHANGES)
    end

    it "has link to go back to Profile page" do
      page.should have_link (Rubeus::BACK)
    end

    describe "Select State dropdown" do
      it 'saves the state attribute based on the dropdown selection' do
        select('Pennsylvania', :from => 'State')
        click_button 'Save changes'
        expect(@user.state).to eq('Pennsylvania')
      end
    end
  end

  describe "Links on Edit page" do

    before :each do
      #@user = FactoryGirl.create(:user)
      visit edit_user_path(@user.id)
    end

    it "should redirect to profile page" do
      click_link Rubeus::BACK
      current_path.should == user_path(@user)
    end

    it "should redirect to profile page" do
      click_link Rubeus::DISCARD_CHANGES
      current_path.should == edit_user_path(@user)
    end

    describe "with invalid information" do
      it "display error when trying to save changes" do
        fill_in "user_name", :with => ''
        click_button Rubeus::SAVE_CHANGES
        page.should have_content('error')
      end
    end
  end
end