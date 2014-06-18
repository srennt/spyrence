require 'spec_helper'
require 'rails_helper'

describe Review do

  context "everything correct" do

  before{@review = Review.new(:name => "Spyros", :email => "hi@email.com", :text => "This is a good review")}

  it "should create a new review" do
    @review.should be_valid
  end
end 


  context "no name given" do

  before{@review = Review.new(:name => "", :email => "hi@email.com", :text => "This is a good review")}

  it "should require a name" do
    @review.should_not be_valid
  end
end  


  context "no email given" do

  before{@review = Review.new(:name => "Spyros", :email => "", :text => "This is a good review")}

  it "should require an email address" do
    @review.should_not be_valid
  end
end  

context "email not in valid format" do

  before{@review = Review.new(:name => "Spyros", :email => "email", :text => "This is a good review")}

  it "should require an email in the typical format" do
    @review.should_not be_valid
  end
end

context "text too short" do

  before{@review = Review.new(:name => "Spyros", :email => "hi@email.com", :text => "Hi!")}

  it "should require the text to be longer than 5 characters" do
    @review.should_not be_valid
  end
end



end