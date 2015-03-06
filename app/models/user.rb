class User < ActiveRecord::Base
	has_secure_password
	has_many :pastries
	has_many :orders
end
