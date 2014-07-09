require 'spec_helper'
require 'rails_helper'

describe ProductsController do

  include Devise::TestHelpers

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    end

describe 'GET #new' do
     it "creates a new product" do
      get :new
      assigns(:product).should be_a_new(Product)
  end
end

describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

end

describe "POST create" do

context "with valid attributes" do  

 it 'redirects to the created product' do
      post :create, product: FactoryGirl.attributes_for(:product)
      response.should redirect_to(Product.last)
    end
  

  it "increases product count by 1" do
        expect {
              post :create, product: FactoryGirl.attributes_for(:product, provider_id: 1)
            }.to change(Product, :count).by(1)
      end


it "assigns a newly created Product as @product" do
        post :create, product: FactoryGirl.attributes_for(:product)
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end
end

context "with invalid attributes" do

 it "cannot save the product if name is blank" do
      post :create, product: FactoryGirl.attributes_for(:product, name: "")
      response.should render_template('new')      

    end

it "cannot save the product if description is too short" do
      post :create, product: FactoryGirl.attributes_for(:product, description: "flight jacket")
      response.should render_template('new')      

    end

end

end

describe "GET 'edit'" do

   before(:each) do 
      @product = FactoryGirl.create(:product)
      get :edit, { :id => @product.id }
  end
    
   it "should render edit template" do
   response.should render_template(:edit)
  end

  end

describe "GET 'show'" do

    it "should assign product as @product" do
      @product = FactoryGirl.create(:product)
      get :show, :id => @product.id
      assigns(:product).should == @product
  end

  end

describe "PUT update" do

context "with valid attributes" do  

 it 'redirects to the updated product' do
      @product = FactoryGirl.create(:product)
      put :update, :id => @product.id, :product => @product.attributes = { :name => "Mens New" }
      response.should redirect_to(Product.last)
    end  
end

context "with invalid attributes" do  

 it 'redirects to the edit template' do
      @product = FactoryGirl.create(:product)
      put :update, :id => @product.id, :product => @product.attributes = { :name => " " }
      response.should render_template(:edit)
    end  
end

end

describe "DELETE destroy" do
    it "destroys the requested product" do
     @product = FactoryGirl.create(:product)
      expect {
        delete :destroy, { :id => @product.id }
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the index products list" do
      @product = FactoryGirl.create(:product)
      delete :destroy, { :id => @product.id }
      response.should redirect_to(products_url)   
  end
end
end




    






    

