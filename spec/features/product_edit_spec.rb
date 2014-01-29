require 'spec_helper'


describe 'Integration tests for edit product page' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @seller=FactoryGirl.create(:user,:email=> 'test@wow.edu')
    @product = FactoryGirl.create(:product, :status => Rubeus::FOR_SALE)
    sign_in_with_valid_credentials(@user)
    visit('/products/1/edit')
  end


  it 'change status from For Sale to Not for Sale' do
    select('Not for Sale', from: 'Status')
    click_button Rubeus::UPDATE
    @product=Product.find(1)
    expect(@product.status).to eq(Rubeus::NOT_FOR_SALE)
  end

  it 'set condition to value from dropdown' do
    condition = 'New'
    select(condition, :from => 'Condition')
    click_button Rubeus::UPDATE
    @product = Product.find(1)
    expect(@product.condition).to eq(condition)
  end

  it 'updates category when the Update button is clicked' do
    select('Furniture', :from => 'Category')
    click_button Rubeus::UPDATE
    @product = Product.find(1)
    expect(page).to have_content("Product was successfully updated.")
    @product = Product.find(1)
    expect(@product.category).to eq('Furniture')
  end
end