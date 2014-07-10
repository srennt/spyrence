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
        @user.attributes = { :email => "bla@blabla.com",
                  :username => "blabla", 
                  :age => "23"}
      end

 it 'updates attributes' do
      put :update, :id => @user.id, :user => @user.attributes
      response.should redirect_to user_path
    end  
    

end

end
