class ContactController < ApplicationController
  def contact_in
  end

  def contact_out
  	ActionMailer::Base.mail(:from => 'rogerrabbit_careerfoundry@yahoo.com', :to => 'spyrosfotiou@gmail.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver
  end
end
