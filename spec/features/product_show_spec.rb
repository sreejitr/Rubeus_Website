require 'spec_helper'

describe 'Integration tests for show page' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @product = FactoryGirl.create(:product)
    end

    it 'Delete button for his own product of a signed user ' do
      sign_in_with_valid_credentials(@user)
      visit('/products/1')
      expect(page).to have_content(@product.title)
      expect(page).to have_text 'Delete'
      click_link 'Delete'
      expect(page).to have_no_content(@product.title)
    end

    it 'Show interest! for an unsigned user' do
      visit('/products/1')
      expect(page).to have_content(@product.title)
      expect(page).to have_text Rubeus::SHOW_INTEREST
      click_link Rubeus::SHOW_INTEREST
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    it 'Show Interest! for a signed user in a product which he wants to buy' do
      sign_in_with_valid_credentials(@user)
      FactoryGirl.create(:user, :email => 'seller@test.edu')
      @not_my_product = FactoryGirl.create(:product, seller_user_id: 2)
      visit('/products/2')
      expect(page).to have_content(@product.title)
      expect(page).to have_text Rubeus::SHOW_INTEREST
      click_link Rubeus::SHOW_INTEREST
      #TODO: Move this spec into a future spec for Messages
    end
end