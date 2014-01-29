require 'spec_helper'

describe Message do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @message = Message.new
  end

  it 'should not create message' do
    @message = Message.new
    assert !@message.save, "Should not save without sender id and recipient id"
  end

  it 'should not create message without sender id' do
    @message = Message.new({sender_id: 1})
    assert !@message.save, "Should not save without recipient id"
  end

  it 'should not create message without body' do
    @message = Message.new({sender_id: 1, recipient_id: 2})
    assert !@message.save, "Should not save without a body"
  end

end

