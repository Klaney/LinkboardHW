class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false},
	email: true

	has_many :posts
	has_many :comments

	validates :password,
	presence: true,
	length: {
		minimum: 8,
		maximum: 99
	}	,
	confirmation: true

	validates :name,
  		presence: true,
  		length: {
  			maximum: 20
  		}
  	validates_presence_of :password, on: :create
	has_secure_password

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
