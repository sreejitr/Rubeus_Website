require 'spec_helper'


describe UsersController do

  include Devise::TestHelpers


  describe "sign in and sign out" do

    signin_user

    it "signs a users in" do
      subject.current_user.should_not be_nil
    end

    it "signs a users out" do
      sign_out @user
      subject.current_user.should be_nil
    end
  end

  context "as a signed in user," do

    signin_user


    describe "GET #edit" do
      it "assigns signed in user" do
       # user = User.create! valid_attributes
        get :edit, {:id => @user.to_param}
        assigns(:user).should eq(@user)
      end
    end

    describe "PUT update" do


      context "valid attributes" do
        it "assigns the signed in user as @user" do
          #@user = User.create! valid_attributes
          put :update, {:id => @user.to_param}
          assigns(:user).should eq(@user)
        end

        it "changes @user's attributes" do
          #@user = User.create! valid_attributes
          put :update, id: @user,
              user: FactoryGirl.attributes_for(:user, phone_no: "1987654322",
                                               address: "Squirrel Hill", city: "Pitts",
                                               state: "PA", zip_code: "15216")
          @user.reload
          @user.phone_no.should eq("1987654322")
          @user.address.should eq("Squirrel Hill")
          @user.city.should eq("Pitts")
          @user.zip_code.should eq("15216")
        end

        it "redirects to the user's page with the updated information" do
          #@user = User.create! valid_attributes
          put :update, {:id => @user.to_param}
          response.should redirect_to(@user)
        end
      end

      context "invalid attributes" do
        it "assigns the signed in user as @user" do
          #@user = User.create! valid_attributes
          put :update, {:id => @user.to_param}
          assigns(:user).should eq(@user)
        end

        describe "does not change @user's attributes" do

          let(:update_with_blank) { -> {
            put :update, id: @user,
                user: FactoryGirl.attributes_for(:user, phone_no: "",
                                                 address: "")
            @user.reload
          } }

          it "should not change user's attributes" do
            expect(update_with_blank).to_not change(@user, :email)
            expect(update_with_blank).to_not change(@user, :city)
          end
        end

        it "re-renders the edit method" do
          User.any_instance.stub(:save).and_return(false)
          put :update, {:id => @user.to_param, :user => { "address" => "" }}
          response.should render_template("edit")
        end
      end
    end
  end

end