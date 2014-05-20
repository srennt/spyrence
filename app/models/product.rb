class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :description, length: { minimum: 20, maximum: 200 }
end
