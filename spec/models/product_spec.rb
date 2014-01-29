require 'spec_helper'

describe Product do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
   #TODO: Find a way to refactor these specs to use FactoryGirl!!!
  end

  it 'should not create product' do
    @prod = Product.new
    assert !@prod.save, "Should not save without description, condition"
  end

  it 'should not create product without description' do
    @prod = Product.new({condition: "fair", title: "Furniture"})
    assert !@prod.save, "Should not save without description"
  end

  it 'should not create product without condition' do
    @prod = Product.new({description: "Small Dining table for two", price: 10, title: "Furniture"})
    assert !@prod.save, "Should not save without condition"
  end

  it 'should not create product without price' do
    @prod = Product.new({description: "Small Dining table for two", condition: "Good", title: "Furniture"})
    assert !@prod.save, "Should not save without price"
  end

  it 'should not create product with non-numerical price' do
    @prod = Product.new({description: "Small Dining table for two", condition: "Good", title: "Furniture", price: "rubeus"})
    assert !@prod.save, "Should not save with string value of price"
  end

  it 'should create product with floating point price' do
    @prod = Product.new({description: "Small Dining table for two", condition: "Good", title: "Furniture", price: "110.99", status: Rubeus::NOT_FOR_SALE})
    assert @prod.save, "Should save with floating point value of price"
  end

  it 'should not create product with invalid status' do
    @prod = Product.new({description: "Small Dining table for two", condition: "Good", title: "Furniture", price: "110.99", status: "my foot"})
    assert !@prod.save, "Should not save with status value of 'my foot'"
  end

  it 'should create product with valid status' do
    @prod = Product.new({description: "Small Dining table for two", condition: "Good", title: "Furniture", price: "110.99", status: Rubeus::NOT_FOR_SALE})
    assert @prod.save, "Should save with status of #{Rubeus::NOT_FOR_SALE}"
  end

  it 'should create product with mandatory fields' do
    @prod = Product.new({description: "Small Dining table for two", condition: "fair", title: "Table", price: 1000, status: Rubeus::NOT_FOR_SALE})
    assert @prod.save, "Should save with description, condition and title"
  end
  
  it 'should create product' do
    @prod = Product.new({description: "Small Dining table for two", condition: "fair"})
    assert !@prod.save, "Shouldnot save without title"
  end

  it 'should destroy product' do
    @prod = Product.new({description: "Small Dining table for two", condition: "fair"})
    @prod.save
    @prod.destroy
    Product.find_by_id(@prod.id).should be_nil
  end
 end
