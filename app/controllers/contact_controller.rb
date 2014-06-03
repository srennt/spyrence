class ContactController < ApplicationController
  def contact_in
  end

  def contact_out
  	ActionMailer::Base.mail(:from => 'from@domain.com', :to => 'to@domain.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver
  end
end
