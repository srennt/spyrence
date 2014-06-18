require 'spec_helper'
require 'rails_helper'

describe Product do

  context "everything correct" do

  before{@product = Product.new(:name => "Flight Jacket", :description => "Cool black flight jacket by Alpha Industries", 
    :image_url => "www.image.com", :price => "26€")}

  it "should create a new product" do
    @product.should be_valid
  end
end 


  context "no name given" do

   before{@product = Product.new(:name => "", :description => "Cool black flight jacket by Alpha Industries", 
    :image_url => "www.image.com", :price => "26€")}
  
  it "should require a name" do
    @product.should_not be_valid
  end
end  


  context "description too short" do

  before{@product = Product.new(:name => "Flight Jacket", :description => "black flight", 
    :image_url => "www.image.com", :price => "26€")}

  it "should require a longer description" do
    @product.should_not be_valid
  end
end  



end