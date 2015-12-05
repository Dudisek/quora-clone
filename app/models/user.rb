class User < ActiveRecord::Base
	# validates :email, uniqueness: true
	validates :email, presence: true, format: { with: /\w@\w{1}+[.]\w{2}/}, :uniqueness => true
	validates :password, length: {minimum: 6}
	validates :name, :presence => true, :length => { :minimum => 3 }, :uniqueness => true

	attr_accessor :user
	
	has_many :answers
	has_many :questions

	has_secure_password



end

