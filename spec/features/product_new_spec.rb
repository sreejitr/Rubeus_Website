require 'spec_helper'

describe 'Integration tests for edit product page' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_with_valid_credentials(@user)
    visit(new_product_path)
  end

  it 'should have a dropdown to specify whether the status of a product is for sale' do
    expect(page).to have_content("Status")
  end

  #it 'the for sale checkbox is checked' do
  #  checkbox = find(".check_box")
  #  checkbox.should be_checked
  #end
end
