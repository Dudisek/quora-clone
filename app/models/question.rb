class Question < ActiveRecord::Base

	validates :title, length: {minimum: 8}

	has_many :answers
	belongs_to :user
end