require 'spec_helper'

  describe 'Integration tests for index page' do
    before(:each) do
      @seller = FactoryGirl.create(:user)
      @user=FactoryGirl.create(:user,:email=> 'test@wow.edu')
      @product = FactoryGirl.create(:product, :status => Rubeus::FOR_SALE)
    end

  it 'Delete button for his own product of a signed user ' do
    sign_in_with_valid_credentials_no_msg_check(@seller)
    expect(page).to have_content 'Signed in successfully'
    visit products_path
    expect(page).to have_content(@product.title)
    expect(page).to have_text 'Delete'
    click_link 'Delete'
    expect(page).to have_no_content(@product.title)
  end

  it 'Show interest! for an unsigned user' do
    visit products_path
    expect(page).to have_content(@product.title)
    expect(page).to have_text Rubeus::SHOW_INTEREST
    click_link Rubeus::SHOW_INTEREST
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  it 'Show interest! for an unsigned seller' do
    visit products_path
    click_link Rubeus::SHOW_INTEREST
    sign_in_with_valid_credentials_no_msg_check(@seller)
    expect(page).to have_content Rubeus::ERROR_OFFER_MSG_FOR_SELLER
    @product.offers.count.should eq(0)
  end

  it 'Show interest! for an unsigned user creates offer after signing in' do
    visit products_path
    click_link Rubeus::SHOW_INTEREST
    sign_in_with_valid_credentials_no_msg_check(@user)
    expect(page).to have_content Rubeus::SUCCESSFUL_OFFER_MSG
    @product.offers.count.should eq(1)
  end

  it 'Show interest! for an unsigned user does not create duplicate offers after signing in' do
    visit products_path
    click_link Rubeus::SHOW_INTEREST
    sign_in_with_valid_credentials_no_msg_check(@user)
    expect(page).to have_content Rubeus::SUCCESSFUL_OFFER_MSG
    @product.offers.count.should eq(1)
    click_link Rubeus::SIGN_OUT
    visit products_path
    click_link Rubeus::SHOW_INTEREST
    sign_in_with_valid_credentials_no_msg_check(@user)
    expect(page).to have_content Rubeus::ERROR_OFFER_MSG
  end

  it 'Show Interest! for a signed user in a product which he wants to buy' do
    sign_in_with_valid_credentials_no_msg_check(@user)
    expect(page).to have_content 'Signed in successfully'
    @not_my_product = FactoryGirl.create(:product, seller_user_id: 2)
    visit products_path
    expect(page).to have_content(@product.title)
    expect(page).to have_text Rubeus::SHOW_INTEREST
    click_link Rubeus::SHOW_INTEREST
    expect(page).to have_text(@product.title)
    expect(page).to have_text(@seller.name)
  end

  it 'Show Interest! for a signed user in a product which he wants to buy' do
    sign_in_with_valid_credentials_no_msg_check(@user)
    expect(page).to have_content 'Signed in successfully'
    @not_my_product = FactoryGirl.create(:product, seller_user_id: 2)
    visit products_path
    expect(page).to have_content(@product.title)
    expect(page).to have_text Rubeus::SHOW_INTEREST
    click_link Rubeus::SHOW_INTEREST
    expect(page).to have_content(@product.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_link(Rubeus::WITHDRAW)
    expect(page).to have_link(Rubeus::SEND_MESSAGE)
    click_link Rubeus::ALL_PRODUCTS
    expect(page).to have_text(Rubeus::PENDING_OFFER)
    expect(page).to have_text('1 Offer')

    #expect(page).to have_content('Subject')
  end

  def sign_in_with_valid_credentials_no_msg_check(user)
    visit user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
  end
end