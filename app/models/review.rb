class Review < ActiveRecord::Base
	validates :name,  :presence => true
	validates :email, :presence => true,
	                  :format => /@/
	validates :text,  :length => { minimum: 5 }                  
end	