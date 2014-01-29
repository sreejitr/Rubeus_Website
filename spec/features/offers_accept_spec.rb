require 'spec_helper'

describe 'Accept Offers' do
  before(:each) do
    @seller = FactoryGirl.create(:user,:name => 'seller', :email => 'seller@mail.edu')
    @buyer = FactoryGirl.create(:user, :name => 'user1')
    @buyer2 = FactoryGirl.create(:user, :name => 'user2', :email => 'buyer2@mail.edu')
    @buyer3 = FactoryGirl.create(:user, :name => 'user3', :email => 'buyer3@mail.edu')
    @product = FactoryGirl.create(:product)
    @offer = FactoryGirl.create(:offer, :buyer_id => 2)
    @offer2 = FactoryGirl.create(:offer, :buyer_id => 3)
    @offer3 = FactoryGirl.create(:offer, :buyer_id => 4)
    sign_in_with_valid_credentials @seller
    visit product_path(@product)
  end

  it 'should delete others offers not accepted' do
     #sign_in_with_valid_credentials
     #visit product_path(@product)
     @product.offers.count.should == 3
     expect(page).to have_content('Offers')
     first('.offer').click_link 'Accept'
     @product.offers.count.should == 1
     #Reload the updated product
     Product.find(@product.id).status.should == Rubeus::SOLD
  end

  it 'should create a new product for the buyer' do
    #buyer_products = Product.find_all_by_seller_user_id(@buyer.id)
    count = Product.find_all_by_seller_user_id(@buyer.id).count
    first('.offer').click_link 'Accept'
    buyer_products = Product.find_all_by_seller_user_id(@buyer.id, :order => 'created_at')
    buyer_products.count.should eq(count+1)

    #the buyer who made the accepted offer should have a new product
    #that product should be identical to the sold product except for the id, timestamps, and owner
    @new_product = buyer_products.last
    @product.attributes.except('id', 'seller_user_id', 'status', 'created_at', 'updated_at').should
      eq( @new_product.attributes.except('id', 'seller_user_id', 'status', 'created_at', 'updated_at'))
    @new_product.status.should eq(Rubeus::NOT_FOR_SALE)
    @new_product.seller_user_id.should eq(@buyer.id)
  end

  it 'should display offer as ACCEPTED to the buyer' do
    first('.offer').click_link 'Accept'
    sign_out
    sign_in_with_valid_credentials @buyer
    visit offers_path
    expect(find(:xpath, "//tbody/tr/td[3]")).to have_content(Rubeus::ACCEPTED_MSG)
  end

  def sign_out
    click_link "Sign Out"
  end
  end