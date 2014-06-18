require 'spec_helper'
require 'rails_helper'

describe Comment do

  context "comment posted successfully" do

  before{@comment = Comment.new(:commenter => "Some guy",
  :body => "Hi")}

  it "should create a new comment" do
    @comment.should be_valid
  end
end  

end