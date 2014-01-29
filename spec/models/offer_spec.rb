require 'spec_helper'

describe Offer do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
  	@offer = Offer.new
  end

 it 'should not create offer' do
      @offer = Offer.new
      assert !@offer.save, "Should not save without buyer id and product id"
 end

  it 'should not create offer without buyer id' do
    @offer = Offer.new({buyer_id: 1})
    assert !@offer.save, "Should not save without buyer id"
  end

  it 'should not create offer without product id' do
    @offer = Offer.new({product_id: 1})
    assert !@offer.save, "Should not save without product id"
  end

  it 'should not create offer with non-numerical buyer id' do
    @offer = Offer.new({buyer_id: "ten"})
    assert !@offer.save, "Should not save with string value of buyer_id"
  end

  it 'should create offer with mandatory fields' do
    @offer = Offer.new({product_id: 1, buyer_id: 1})
    assert @offer.save, "Should save with product_id and buyer_id"
  end
  
  it 'should destroy offer' do
    @offer = Offer.new({buyer_id: 1, product_id: 1})
    @offer.save
    @offer.destroy
    Offer.find_by_id(@offer.id).should be_nil
  end

end
