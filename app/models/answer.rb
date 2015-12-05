class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	has_many :avotes

	validates :comment, presence: true
end