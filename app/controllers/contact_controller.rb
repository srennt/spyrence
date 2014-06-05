class ContactController < ApplicationController
  def contact_in
  end

  def contact_out
  	ActionMailer::Base.mail(:from => 'app25534450@heroku.com', :to => 'spyrosfotiou@gmail.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver
  end
end
