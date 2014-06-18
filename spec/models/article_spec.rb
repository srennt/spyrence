require 'spec_helper'
require 'rails_helper'

describe Article do

  context "title and text correct" do

  before{@article = Article.new(:title => "Title",
  :text => "This is text")}

  it "should create a new article" do
    @article.should be_valid
  end
end 

  context "title empty" do

  before{@article = Article.new(:title => "",
  :text => "This is text")}

  it "should require a title" do
    @article.should_not be_valid
  end
end  

  context "title less than 5 characters" do

  before{@article = Article.new(:title => "Titl",
  :text => "This is text")}

  it "should reject titles less than 5 characters" do
    @article.should_not be_valid
  end
end  

end