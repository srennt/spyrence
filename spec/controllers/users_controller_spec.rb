require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	include Devise::TestHelpers

	before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    end

    describe "GET 'show'" do
	
      it "showcases the user currently signed in" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
  end

  describe "GET 'edit'" do
	
      it "should render the edit template" do
      get :edit, :id => @user.id
      response.should render_template(:edit)
    end
  end

  describe "PUT update" do 

    before(:each) do
        @attr = { :email => "bla@blabla.com",
                  :password => "blablanew", 
                  :password_confimation => "blablanew",
                  :current_password => "blax123bla" }
        @user.should_receive(:update_attributes).and_return(true)
      end

 it 'changes the password' do
      put :update, :id => @user.id, :user => @attr
      response.should redirect_to '/'
    end    

end

end
