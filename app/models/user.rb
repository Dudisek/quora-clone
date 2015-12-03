class User < ActiveRecord::Base
	# validates :email, uniqueness: true
	validates :email, presence: true, format: { with: /\w@\w{1}+[.]\w{2}/}, :uniqueness => true
	validates :name, presence: true
	validates :password, length: {minimum: 6}

	has_secure_password validations: false

	# before_create
end

