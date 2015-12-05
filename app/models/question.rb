class Question < ActiveRecord::Base

	validates :title, length: {minimum: 8}
	belongs_to :user

	has_many :answers
	has_many :qvotes
end