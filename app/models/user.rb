class User < ActiveRecord::Base
	has_secure_password
	has_many :pastries
	has_many :orders

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
# check if owner of pastry
# return true or false
	def owns(pastry)
		pastry.user == self
	end
end
