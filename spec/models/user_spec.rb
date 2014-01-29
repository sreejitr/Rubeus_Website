require 'spec_helper'


describe User do

  it 'will add a valid user' do
    user1 = User.create!(name: "John Doe", email: "johndoe@mail.edu", password: "abcd1234", address: "abc", phone_no: "123", city: "abc", state: "abc", zip_code: "123")
    expect(User.count).to eq(1)
  end

  context "new user data validation tests" do
    it 'rejects a password shorter than 8 characters' do
      #expect(User.new(email: "johndoe@mail.edu", password: "abc")).to_not be_valid
      expect(FactoryGirl.build(:user, password: "abc")).to_not be_valid
    end

    it 'rejects mismatched password / password_confirmation' do
      expect(User.new(email: "johndoe@gmail.edu", password: "password", password_confirmation: "wordpass",address: "abc", phone_no: "123", city: "abc", state: "abc", zip_code: "123")).to_not be_valid
    end

    it "rejects email addresses with more less than 1 @ symbol" do
      expect(User.new(email: "johndoegmail.edu", password: "password",address: "abc", phone_no: "123", city: "abc", state: "abc", zip_code: "123")).to_not be_valid
      expect(User.new(email: "johndoe@@gmail.edu", password: "password",address: "abc", phone_no: "123", city: "abc", state: "abc", zip_code: "123")).to_not be_valid
    end

    it 'rejects phone no. which is not valid' do
      expect(User.new(email: "johndoe@mail.edu", password: "abcd1234", address: "abc", phone_no: "asdasd", city: "abc", state: "abc", zip_code: "123")).to_not be_valid
    end

    it 'rejects phone no. which is not valid' do
      expect(User.new(email: "johndoe@mail.edu", password: "abcd1234", address: "abc", phone_no: "123", city: "abc", state: "abc", zip_code: "asdasd")).to_not be_valid
    end
  end

  #context "sign out and sign in" do
  #  it "signs users in" do
  #    @user = User.create!(email: "johndoe@gmail.edu", password: "password")
  #    sign_in @user
  #    user_signed_in?.should == true
  #  end
  #end
  #TODO: it { should have_private_messages }
end